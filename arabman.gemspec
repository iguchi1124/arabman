# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arabman/version'

Gem::Specification.new do |spec|
  spec.name          = "arabman"
  spec.version       = Arabman::VERSION
  spec.authors       = ["Shota Iguchi"]
  spec.email         = ["e.iguchi1124@gmail.com"]

  spec.summary       = %q{Convert arabic numbers to roman number.}
  spec.description   = %q{Convert arabic numbers to roman number.}
  spec.homepage      = "https://github.com/iguchi1124/arabman"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
