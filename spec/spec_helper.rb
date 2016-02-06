$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'resume_base'

RSPEC_FIXTURE_PATH = File.expand_path('../fixtures', __FILE__)

require 'simplecov'
SimpleCov.start