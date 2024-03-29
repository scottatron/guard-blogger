# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/blogger/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-blogger"
  spec.version       = Guard::BloggerVersion::VERSION
  spec.authors       = ["Scott Arthur"]
  spec.email         = ["scott@scottatron.com"]
  spec.summary       = "Guard plugin for updating Blogger templates"
  spec.description   = ""
  spec.homepage      = "http://github.com/scottatron/guard-blogger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "guard"
  spec.add_dependency "capybara"
  spec.add_dependency "selenium-webdriver"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
