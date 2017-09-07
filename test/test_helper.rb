require 'simplecov'
SimpleCov.add_filter ['app/controllers/v1/concerns/docs', 'app/models/concerns/docs', 'app/services', 'app/workers', 'app/channels', 'app/jobs', 'app/mailers']
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
