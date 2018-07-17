require './config/environment'
require 'pony'
require 'dotenv/load'


scheduler = Rufus::Scheduler.new

def send_resource
  users = User.all
  users.each do |user|
    topics = user.topic
    topic = topics.sample(1)
      if topic[0]
        resources = topic[0].resources
        resource = resources.sample(1)
        username = user.username
        send_mail(user.email, resource[0].url, topic[0].name, username )
    end
  end
end

def send_mail (recipient, url, topic, username)
  path = File.expand_path('../app/views/resource_link.erb', File.dirname(__FILE__))
  file = ERB.new(File.read(path)).result(binding)
    Pony.options = {
      :via => :smtp,
      :headers => { 'Content-Type' => 'text/html' },
      :body => file,
      :subject => "Your Resource for the day",
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => ENV['GMAIL_ID'],
        :password             => ENV['GMAIL_PASS'],
        :authentication       => :plain,
        :domain               => "localhost.localdomain" 
      }
    }
    Pony.mail(:to => recipient)
end


scheduler.in '1s' do
  send_resource 
end

scheduler.join