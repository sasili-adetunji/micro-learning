source 'http://rubygems.org'

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'dotenv'
gem 'foreman'
gem 'pg'
gem 'pony', '~> 1.12'
gem 'rack-flash3'
gem 'rake'
gem 'require_all'
gem 'require_relative'
gem 'rubocop', require: false
gem 'rubocop-airbnb'
gem 'rufus-scheduler', '~> 3.2'
gem 'sinatra'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'thin'
gem 'tux'

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov'
  gem 'simplecov-console'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem 'sqlite3'
end

group :development do
  gem 'pry'
  gem 'shotgun'
end
