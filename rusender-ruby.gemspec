require File.expand_path('lib/rusender/version', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'rusender-ruby'
  spec.version = RuSender::VERSION
  spec.summary = 'EDIT ME: Summary'
  spec.authors = ['Evgeniy Serykh']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.59'
  spec.add_development_dependency 'webmock', '~> 3.0'

  spec.add_runtime_dependency 'faraday', '~> 0.10'
  spec.add_runtime_dependency 'mime-types', '~> 3.0'
end
