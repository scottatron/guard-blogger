# Guard::Blogger

Guard plugin to update a Blogger template.

## Requirements

You will need Firefox installed as this plugin currently uses selenium-webdriver

## Installation

Add to your Gemfile:

    gem 'guard-blogger'

Init the Guardfile definition:

    guard init blogger

Set your Blogger login credentials and the name of your blog in the Guardfile:

    guard :blogger, email: 'blogger@mydomain.com', password: 'sshhhhhhitsasecret', blog: 'My Blog' do
      watch 'template.xml'
    end
