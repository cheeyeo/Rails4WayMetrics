$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongo_metrics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongo_metrics"
  s.version     = MongoMetrics::VERSION
  s.authors     = ["Chee Yeo"]
  s.email       = ["ckyeo.1@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MongoMetrics."
  s.description = "TODO: Description of MongoMetrics."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", "~> 4.2.0"
  s.add_dependency "sprockets-rails", "~> 2.2.4"

  s.add_dependency "mongoid", "~> 4.0.2"
  s.add_development_dependency "jquery-rails", "~> 3.0.1"
end
