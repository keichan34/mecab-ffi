# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'me_cab/version'

Gem::Specification.new do |spec|
  spec.name          = "mecab_ffi"
  spec.version       = MeCab::VERSION
  spec.authors       = ["Keitaroh Kobayashi"]
  spec.email         = ["keita@kkob.us"]
  spec.summary       = %q{Ruby FFI Bindings to the MeCab library.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ffi', '~> 1.9.3'
  spec.add_dependency 'activesupport', '> 0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "ffi-swig-generator"
  spec.add_development_dependency "rspec", "~> 3.0"
end
