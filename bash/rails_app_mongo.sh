#!/usr/bin/env bash


echo

if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Creating rails app $1"  # Need quotes to escape #
fi 



rails new $1 -JTO

cd $1


cat > ./Gemfile << EOF
source 'http://rubygems.org'

gem 'jquery-rails'

gem 'compass', '>= 0.10.2'
gem 'compass-960-plugin', '>= 0.0.1' ,:require => 'ninesixty'
gem 'slim', '>= 0.0.1'

gem 'mongoid', '>= 2.0.1'
gem 'bson_ext', '>= 1.3.0'
gem 'devise', '>= 1.3.1'


gem 'aws-s3'

gem 'rspec-rails', '>= 2.5.0', :group => [:development, :test]
gem 'database_cleaner', '>= 0.6.6', :group => :test
gem 'factory_girl_rails', ">= 1.1.beta1", :group => :test
gem 'mongoid-rspec', ">= 1.4.1", :group => :test


gem 'cucumber-rails', ">= 0.4.1", :group => :test
gem 'capybara', ">= 0.4.1.2", :group => :test

EOF

bundle install

rails generate jquery:install
rails generate rspec:install
rails generate cucumber:install --capybara --rspec --skip-database
rails generate mongoid:config
rails generate devise:install

compass init rails -r ninesixty --using 960

rm public/index.html
rm public/images/rails.png
rm -rf test/

echo "Still to do \n remove require 'rails/test_unit/railtie' in config/application.rb \n comment out  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
# config.use_transactional_fixtures = true in spec/spec_helper.rb

#rm app/views/layouts/application.html.erb



