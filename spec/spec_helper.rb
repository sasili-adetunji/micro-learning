ENV["RACK_ENV"] = "test"

require 'rack/test'
require 'rspec'
require_relative '../config/environment'


# remove loggers
ActiveRecord::Base.logger = nil

module RSpecMixin
  include Rack::Test::Methods
  DatabaseCleaner.strategy = :truncation
  def app
    described_class
  end
end

RSpec.configure do |config|
  config.include RSpecMixin

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end
end