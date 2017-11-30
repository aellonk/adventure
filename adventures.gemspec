# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adventures/version'

Gem::Specification.new do |spec|
  spec.name          = "adventures"
  spec.version       = Adventures::VERSION
  spec.authors       = ["Aellon Krider"]
  spec.email         = ["aellonkrider@gmail.com"]

  spec.summary       = %q{"CLI gem project to find outdoor adventures nearby"}
  spec.homepage      = "https://github.com/aellonk/adventures"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
