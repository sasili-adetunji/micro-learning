require 'sinatra'
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base
  get '/' do
    return "This is the home page"
  end
end