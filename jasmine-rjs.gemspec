# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jasmine/rjs/version'

Gem::Specification.new do |spec|
  spec.name          = "jasmine-rjs"
  spec.version       = Jasmine::Rjs::VERSION
  spec.authors       = ["siddick"]
  spec.email         = ["siddick@gmail.com"]

  spec.summary       = %q{Rails plugin to integrate Jasmine, Require.js and Karma.}
  spec.description   = %q{Rails plugin to integrate Jasmine, Require.js and Karma.}
  spec.homepage      = "https://github.com/siddick/jasmine-rjs"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jasmine", ">= 2.2.0"
  spec.add_dependency "requirejs-rails", ">= 0.9.5"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.2.0"
end
