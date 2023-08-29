require_relative "lib/omniauth-asana/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-asana"
  spec.version = Omniauth::Asana::VERSION
  spec.authors = ["Yuta Morinaga"]
  spec.email = ["yuta@culturescience.io"]

  spec.summary = "This Gem contains the Asana strategy for OmniAuth using OAuth2"
  spec.homepage = "https://github.com/Culture-Science/omniauth-asana"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/Culture-Science/omniauth-asana/issues",
    "changelog_uri" => "https://github.com/Culture-Science/omniauth-asana/releases",
    "source_code_uri" => "https://github.com/Culture-Science/omniauth-asana",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE.txt README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "thor", "~> 1.2"
  spec.add_dependency 'omniauth', '~> 2.0'
  spec.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'
end
