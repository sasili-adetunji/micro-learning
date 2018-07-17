require './config/environment'
require 'pony'
require 'dotenv/load'


scheduler = Rufus::Scheduler.new


def send_resource
  users = User.all
  users.each do |user|
    topics = user.topic
    topics.each do |topic|
      resources = topic.resources
      resources.each do |resource |

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
        Pony.mail(:to => user.email)
      end
    end
  end
end

scheduler.in '1s' do
  send_resource 
end

scheduler.join