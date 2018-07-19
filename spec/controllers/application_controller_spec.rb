require 'spec_helper'

describe ApplicationController do
  it 'loads the homepage if user is not logged in' do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("About MicroLearning")
  end
end