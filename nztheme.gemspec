# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "nztheme"
  spec.version       = "0.2.1"
  spec.authors       = ["Nattawut Phetmak"]
  spec.email         = ["neizod@gmail.com"]

  spec.summary       = "Write a short summary, because Rubygems requires one."
  spec.homepage      = "https://github.com/neizod/polar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
