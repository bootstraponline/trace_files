# encoding: utf-8
require File.join(__dir__, 'lib/trace_files/version')

Gem::Specification.new do |spec|
  # TracePoint is new in Ruby 2. Doesn't exist in 1.9
  spec.required_ruby_version = '>= 2'

  spec.name          = 'trace_files'
  spec.version       = TraceFiles::VERSION
  spec.authors       = ['bootstraponline']
  spec.email         = ['code@bootstraponline.com']
  spec.licenses      = ['Apache 2.0']

  spec.summary       = 'Trace Ruby files'
  spec.description   = spec.summary + '.'
  spec.homepage      = 'https://github.com/bootstraponline/trace_files'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'appium_thor', '~> 0.0', '>= 0.0.7'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'thor', '~> 0.19.1'
  spec.add_development_dependency 'coveralls', '~> 0.8.1'
end
