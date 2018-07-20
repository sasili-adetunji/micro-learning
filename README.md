# Micro-Learning
Micro-Learning is an app that allows user to learn, based on short, concise lessons delivered to learners when it suits them. A daily resource will be provided to user on topic they choose to learn. 

[![Build Status](https://travis-ci.org/sasili-adetunji/micro-learning.svg?branch=develop)](https://travis-ci.org/sasili-adetunji/micro-learning)
[![Coverage Status](https://coveralls.io/repos/github/sasili-adetunji/micro-learning/badge.svg?branch=develop)](https://coveralls.io/github/sasili-adetunji/micro-learning?branch=develop)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/sasili-adetunji/micro-learning)

### Features of Micro-Learning
- Signup with username, email and password
- Login with email and password
- Search for a topic
- Add topic to learn
- Daily resource provided for each topic by email
- Add topics by admin
- Add resources by admin
- Delete and edit resources and topics by admin

### Installation Guide
- Install Ruby here and install it.
- Install RVM(Ruby Version Manager)
- Clone this repository with "git clone https://github.com/sasili-adetunji/micro-learning.git"
- run `bundle install` to install the dependencies.
- Navigate into the cloned project directory.
- Edit the `env-sample` file with your gmail creadentials and save it as `.env`
- run `shotgun`
- Navigate to `localhost:9393`


### Running Test
- run `rspec`

### Technologies
- Ruby: A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.

- ActiveRecord: Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It

- Sinatra: Sinatra is a free and open source software web application library and domain-specific language written in Ruby. It is an alternative to other Ruby web application frameworks such as Ruby on Rails, Merb, Nitro, and Camping. It is dependent on the Rack web server interface. It is named after musician Frank Sinatra.

- Rspec: RSpec is a 'Domain Specific Language' (DSL) testing tool written in Ruby to test Ruby code.It is a behavior-driven development (BDD) framework which is extensively used in the production applications. The basic idea behind this concept is that of Test Driven Development (TDD) where the tests are written first and the development is based on writing just enough code that will fulfill those tests followed by refactoring.

- Postgres: PostgreSQL, often simply Postgres, is an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards compliance. As a database server, its primary functions are to store data securely and return that data in response to requests from other software applications.

### License
This project is authored by Sasiliyu Adetunji, and is licensed for use, distribution and modification under the MIT license