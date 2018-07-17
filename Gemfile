source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'pg'
gem 'rufus-scheduler', '~> 3.2'
gem 'pony', '~> 1.12'
gem 'foreman'
gem 'require_relative'
gem 'dotenv'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem 'sqlite3'
end


group :development do
  gem 'shotgun'
  gem 'pry'
end
