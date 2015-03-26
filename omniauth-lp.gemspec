$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omniauth/lp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omniauth-lp"
  s.version     = Omniauth::Lp::VERSION
  s.authors     = ["Steve Dalton"]
  s.email       = ["steve@literacyplanet.com"]
  s.homepage    = "http://literacyplanet.com"
  s.summary     = "Omniauth strategy for Literacy Planet."
  s.description = "Literacy Planet"
  s.license     = ""

  s.files = Dir["{lib}/**/*", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'omniauth-oauth2',     '~> 1.2.0'

end
