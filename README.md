Deadline Tracker for UBC Students
=================================
[![capstone-ci](https://github.com/Griffin-Brome/Capstone/actions/workflows/capstone.yml/badge.svg)](https://github.com/Griffin-Brome/Capstone/actions/workflows/capstone.yml)

Installation
------------
This project requires 
- Ruby 3
- SQLite 3
  - libsqlite3-dev
- Node 12
  - yarn


Getting Started
---------------
1. Clone the repository
```
git clone git@github.com:Griffin-Brome/Capstone.git
```
1. Install Dependencies
```
bundle install

yarn install
```
1. Start the development server
```
bundle exec rails server
```
1. Head to [localhost:3000](http://localhost:3000) on your web browser to view the site

Verifying a Created Account
---------------------------
1. Setup an SMTP server (i.e Mailtrap) inside of a Rails.application.configure block inside of config/development.rb
1. Click the confirmation link on the email sent to your test SMTP server.

Test Suite
----------
The test suite is run with
```
bundle exec rails test
```

You may need to migrate the DB first
```
rails db:migrate RAILS_ENV=test
```

Style Checking/Linting
----------------------
```
bundle exec rubocop -a
```
Note: this will "safe autocorrect" some style errors
