# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resume_base/version'

Gem::Specification.new do |spec|
  spec.name          = 'resume_base'
  spec.version       = ResumeBase::VERSION
  spec.authors       = ['Rick Mark']
  spec.email         = ['rickmark@outlook.com']
  spec.licenses      = 'Nonstandard'

  spec.summary       = 'Basic models for use in any personal resume site'
  spec.description   = 'This gem encapsulates basic logic for resume models \
to be reused in any personal website'
  spec.homepage      = 'https://bitbucket.org/rickmark/resume_base'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://gems.rickmark.me'
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem \
pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) do |f|
    File.basename(f)
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'simplecov', '~> 0.10'

  spec.add_runtime_dependency 'activemodel', '~> 4'
end
