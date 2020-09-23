# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative 'lib/image_fetcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'image_fetcher'
  spec.version       = ImageFetcher::VERSION
  spec.authors       = ['IlkhamGaysin']
  spec.email         = ['ilgamgaysin@gmail.com']

  spec.summary       = 'image-fetcher allows to download images from a file containing list of uri to those images.'
  spec.homepage      = 'https://github.com/IlkhamGaysin/image-fetcher'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.1')

  spec.metadata['allowed_push_host'] = 'http://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/IlkhamGaysin/image-fetcher'
  spec.metadata['changelog_uri'] = 'https://github.com/IlkhamGaysin/image-fetcher/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'memory_profiler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-faker'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
