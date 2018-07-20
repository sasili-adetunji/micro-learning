require 'spec_helper'

describe ResourceController do
  describe 'Create new resource' do

    it 'let a logged in admin view resource form' do
      user = User.create(:username => "adminuser",:email => "adminuser@example.com", :password => "adminpass", :admin =>true)

      visit '/login'

      fill_in(:username, :with => "adminuser")
      fill_in(:password, :with => "adminpass")
      click_button 'Login'

      visit '/resources/new'
      expect(page.current_path).to include('/resource')
      expect(page.body).to include('Create resource')
    end

    it 'let a logged in admin create a resource' do
      user = User.create(:username => "adminuser",:email => "adminuser@example.com", :password => "adminpass", :admin =>true)

      visit '/login'

      fill_in(:username, :with => "adminuser")
      fill_in(:password, :with => "adminpass")
      click_button 'Login'

      visit '/resources/new'
      fill_in(:title, :with => "Guitar")
      fill_in(:description, :with => "Guitar's best resources")
      fill_in(:url, :with => "www.guitar.com")

      click_button 'Create resource'

      resource = Resource.find_by(:title => "Guitar")
      expect(resource).to be_instance_of(Resource)
      expect(resource.description).to eq("Guitar's best resources")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Resource index pages' do
    it 'let a logged in user view the topic index page' do
      user = User.create(:username => "tester",:email => "tester@example.com", :password => "tester", :admin => true)
      resource = Resource.create(title: "CSS Essentials", description: "Cascading Style sheet", url: "css.org")
    
      visit '/login'

      fill_in(:username, :with => "tester")
      fill_in(:password, :with => "tester")
      click_button 'Login'

      visit "/resources"
      expect(page.body).to include(resource.title)
      expect(page.body).to include(resource.url)
    end
    
    it 'does not let a user view the topic index if not logged in' do
      get '/resources'
      expect(last_response.location).to include("/login")
    end
  end
end