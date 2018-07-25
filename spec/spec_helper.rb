require 'coveralls'
require 'simplecov'
require 'simplecov-console'
Coveralls.wear!
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console,
    # Want a nice code coverage website? Uncomment this next line!
    # SimpleCov::Formatter::HTMLFormatter
  ]
)
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require_relative '../config/environment'
require 'capybara/rspec'
require 'capybara/dsl'

# remove loggers
ActiveRecord::Base.logger = nil

module RSpecMixin
  include Rack::Test::Methods
  include Capybara::DSL

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
  config.order = 'default'
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
