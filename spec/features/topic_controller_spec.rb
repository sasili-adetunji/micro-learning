require 'spec_helper'

describe TopicController do
  describe 'Create new topic' do
    it 'let a logged in admin view topic form' do
      User.create(username: 'adminuser', email: 'adminuser@example.com',
                  password: 'adminpass', admin: true)

      visit '/login'

      fill_in(:username, with: 'adminuser')
      fill_in(:password, with: 'adminpass')
      click_button 'Login'

      visit '/topics/new'
      expect(page.current_path).to include('/topics')
    end

    it 'let a logged in admin create a topic' do
      User.create(username: 'adminuser', email: 'adminuser@example.com',
                  password: 'adminpass', admin: true)

      visit '/login'

      fill_in(:username, with: 'adminuser')
      fill_in(:password, with: 'adminpass')
      click_button 'Login'

      visit '/topics/new'
      fill_in(:name, with: 'Guitar')
      fill_in(:description, with: 'Learn how to play guitar the right way!')
      click_button 'Create topic'

      topic = Topic.find_by(name: 'Guitar')
      expect(topic).to be_instance_of(Topic)
      expect(topic.description).to eq('Learn how to play guitar the right way!')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Topic index pages' do
    it 'let a logged in user view the topic index page' do
      User.create(username: 'tester', email: 'tester@example.com',
                  password: 'tester', admin: true)
      topic1 = Topic.create(name: 'CSS Essentials',
                            description: 'CSS is essential for front end')

      User.create(username: 'tester2', email: 'teter2@example.com',
                  password: 'tester2', admin: false)
      topic2 = Topic.create(name: 'Python Fundamentals',
                            description: 'Python is a cool programming language')

      visit '/login'

      fill_in(:username, with: 'tester')
      fill_in(:password, with: 'tester')
      click_button 'Login'

      visit '/topics'
      expect(page.body).to include(topic1.name)
      expect(page.body).to include(topic2.name)
    end

    it 'does not let a user view the topic index if not logged in' do
      get '/topics'
      expect(last_response.location).to include('/login')
    end
  end

  context 'Single topic page' do
    it 'let a logged in user view single topic page' do
      User.create(username: 'testert', email: 'tester2@example.com',
                  password: 'teasing', admin: false)
      User.create(username: 'testers', email: 'tester3@example.com',
                  password: 'anothertest', admin: true)
      topic = Topic.create(name: 'CSS Fundamentals',
                           description: 'CSS is necessary for frontend')

      visit '/login'

      fill_in(:username, with: 'testers')
      fill_in(:password, with: 'anothertest')
      click_button 'Login'

      visit "/topics/#{topic.id}"

      expect(page.body).to include('CSS is necessary for frontend')
      expect(page.body).to include('CSS Fundamentals')
    end

    it 'does not let a user view single topic page if not logged in' do
      topic = Topic.create(name: 'CSS Fundamentals',
                           description: 'CSS is necessary for frontend')

      visit "/topics/#{topic.id}"

      expect(page.current_path).to include('/login')
    end
  end

  context 'Edit single topic page' do
    it 'let a logged in admin edit a topic' do
      User.create(username: 'teasers', email: 'testerss@example.com',
                  password: 'testingtest', admin: true)
      topic = Topic.create(name: 'CSS Fundamentals',
                           description: 'CSS is necessary for frontend')

      visit '/login'

      fill_in(:username, with: 'teasers')
      fill_in(:password, with: 'testingtest')
      click_button 'Login'

      visit "/topics/#{topic.id}/edit"
      expect(page.body).to include('Update topic')
    end
  end
end
