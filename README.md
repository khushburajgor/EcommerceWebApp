# README

This README would normally document whatever steps are necessary to get the
application up and running.

##Application Setup

##Ruby Version

**Ruby 3.3.0**
**System Dependencies**
**System Dependencies**
**PostgreSQL**
**Redis**
**Node.js and Yarn**
**ImageMagick**
**Configuration**
**Clone the repository.**

##Run bundle install to install dependencies.

##Set up environment variables as needed.

Database Creation run below command

- rails db:create

For Database Initialization

 - rails db:migrate

For run test suite
- rails test 

Gems Used

Rails 7.0.8.4
**Sprockets-Rails**
**pg**
**Puma**
**Importmap-Rails**
**Turbo-Rails**
**Stimulus-Rails**
**Jbuilder**
**Redis**
**Debug (development and test)**
**Web-Console (development)**
**Capybara (test)**
**Selenium-WebDriver (test)**
**ActiveAdmin and related gems**
**Devise**

**Image Processing**
**Elasticsearch-Rails and Elasticsearch-Model**
**JQuery-Rails**
**Byebug**
**Sassc-Rails and Sassc**

##Services

**Web Server: Puma**

**Job Queue: Active Job with Redis**

**Cache Server: Redis**

**Search Engine: Elasticsearch**

##Deployment Instructions

**Precompile assets: rails assets:precompile**

**Migrate the database: rails db:migrate**

**Start the server: rails server**

##API Search Example

Use the following curl command to search for products:

curl -X GET "http://localhost:3000/api/v1/products/search?query=shirt"
