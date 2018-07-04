# require 'sinatra'
# require 'sinatra/activerecord'

# set :database_file, "config/database.yml"

# class MicroLearning < Sinatra::Base
#   set :environment, ENV['RACK_ENV']

#   configure do
#   end

#   Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each {
#     |model| require model }

#   Dir[File.join(File.dirname(__FILE__), 'controllers', '*.rb')].each { |lib| 
#     load lib }

# end