# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'envryo/version'

Gem::Specification.new do |spec|
  spec.name          = "envryo"
  spec.version       = Envryo::VERSION
  spec.authors       = ["meganemura"]
  spec.email         = ["mura2megane@gmail.com"]
  spec.summary       = %q{Evernote various events notifier via Yo.}
  spec.description   = spec.description
  spec.homepage      = "https://github.com/meganemura/envryo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency     "evernote_oauth", "~> 0.2"
  spec.add_runtime_dependency     "yoyo", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
