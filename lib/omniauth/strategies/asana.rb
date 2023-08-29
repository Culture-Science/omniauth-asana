require "omniauth/strategies/oauth2"
require "uri"
require "rack/utils"

module OmniAuth
  module Strategies
    class Asana < OmniAuth::Strategies::OAuth2
      option :name, "asana"

      option :authorize_options, [:scope]

      option :client_options, {
        site: "https://app.asana.com/",
        authorize_url: "https://app.asana.com/-/oauth_authorize",
        token_url: "https://app.asana.com/-/oauth_token",
        response_type: "code"
      }

      option :auth_token_params, {
        grant_type: "authorization_code"
      }      

      uid { raw_info['id'].to_s }

      info do
        {
          'name' => raw_info['name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.params['data']
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
