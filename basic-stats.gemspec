# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'basic/stats/version'

Gem::Specification.new do |spec|
  spec.name          = "basic-stats"
  spec.version       = Basic::Stats::VERSION
  spec.authors       = ["Christopher Petersen"]
  spec.email         = ["chris@petersen.io"]
  spec.description   = %q{Basic statistical functions for Ruby collections, such as mean, standard_deviation, z, and outlier detection}
  spec.summary       = %q{Basic statistical functions for Ruby collections, such as mean, standard_deviation, z, and outlier detection}
  spec.homepage      = "http://github.com/cpetersen/basic-stats"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
