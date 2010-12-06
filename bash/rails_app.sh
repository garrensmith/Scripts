#!/usr/bin/env bash


echo

if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Creating rails app $1"  # Need quotes to escape #
fi 



rails new $1 -JT

cd $1


cat > ./Gemfile << EOF
gem 'jquery-rails'

group :development, :test do
  gem 'autotest'
  gem "rspec-rails", ">= 2.2.1"
end


group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber', '>= 0.7.3'
  gem "rspec-rails", ">= 2.2.1"
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end  

EOF


bundle install

rails generate jquery:install
rails generate rspec:install
rails generate cucumber:install --rspec --capybara


