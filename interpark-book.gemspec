# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interpark/book/version'

Gem::Specification.new do |spec|
  spec.name          = "interpark-book"
  spec.version       = Interpark::Book::VERSION
  spec.authors       = ["Taekmin Kim"]
  spec.email         = ["tantara.tm@gmail.com"]
  spec.description   = %q{인터파크 도서 API}
  spec.summary       = %q{인터파크 도서 API}
  spec.homepage      = "https://github.com/wafflestudio/interpark-book"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
