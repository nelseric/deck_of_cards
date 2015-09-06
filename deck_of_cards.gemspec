# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deck_of_cards/version'

Gem::Specification.new do |spec|
  spec.name          = "deck_of_cards"
  spec.version       = DeckOfCards::VERSION
  spec.authors       = ["Eric Nelson"]
  spec.email         = ["nelseric.alt@gmail.com"]

  spec.summary       = %q{DeckOfCards is an implementation of a playing card deck in ruby.}
  spec.homepage      = "https://github.com/nelseric/deck_of_cards"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"

  spec.add_development_dependency "guard-rspec"
end
