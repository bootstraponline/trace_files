# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trace_files/version'

Gem::Specification.new do |spec|
  spec.name          = 'trace_files'
  spec.version       = TraceFiles::VERSION
  spec.authors       = ['bootstraponline']
  spec.email         = ['code@bootstraponline.com']

  spec.summary       = 'Trace Ruby files'
  spec.description   = spec.summary + '.'
  spec.homepage      = 'https://github.com/bootstraponline/trace_files'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'appium_thor', '~> 0.0', '>= 0.0.7'
end
