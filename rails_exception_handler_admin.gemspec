$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_exception_handler_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_exception_handler_admin"
  s.version     = RailsExceptionHandlerAdmin::VERSION
  s.authors     = ["Matt G Widmann"]
  s.email       = ["mgwidmann@gmail.com"]
  s.homepage    = "https://github.com/mgwidmann/rails_exception_handler_admin"
  s.summary     = "Rails Exception Handler Admin interface."
  s.description = "Rails Exception Handler Admin interface built on rails scaffolding with a twitter bootstrap theme."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3"
  s.add_dependency "will_paginate"
end
