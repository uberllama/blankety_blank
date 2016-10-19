# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blankety_blank/version'

Gem::Specification.new do |spec|
  spec.name          = "blankety_blank"
  spec.version       = BlanketyBlank::VERSION
  spec.authors       = ["Yuval Kordov", "Little Blimp"]
  spec.email         = ["yuval@littleblimp.com"]
  spec.summary       = "Keep those empty strings out of your database!"
  spec.description   = "Sets blank attributes to nil as part of validation"
  spec.homepage      = "http://github.com/uberllama/blankety_blank"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "activesupport", ">= 3.0.0"
  spec.add_development_dependency "activerecord", ">= 4.2.7.1"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
