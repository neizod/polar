# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-polar"
  spec.version       = "1.0.0"
  spec.authors       = ["Nattawut Phetmak"]
  spec.email         = ["neizod@gmail.com"]

  spec.summary       = "White, clean, no JavaScript Jekyll Theme"
  spec.homepage      = "https://github.com/neizod/polar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 3.0"
end
