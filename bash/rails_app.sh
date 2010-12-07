#!/usr/bin/env bash


echo

if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Creating rails app $1"  # Need quotes to escape #
fi 



rails new $1 -JT

cd $1


cat > ./Gemfile << EOF
source 'http://rubygems.org'

gem 'jquery-rails'

gem 'compass', '>= 0.10.2'
gem 'compass-960-plugin', '>= 0.0.1' ,:require => 'ninesixty'
gem 'haml-rails', '>= 0.0.1'
gem 'nifty-generators', '>= 0.0.1'


group :development, :test do
  gem 'autotest'
  gem 'rspec-rails', '>= 2.0.0'
end


group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber', '>= 0.7.3'
  gem 'rspec-rails', '>= 2.0.0'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end  

EOF

bundle install

rails generate jquery:install
rails generate rspec:install
rails generate cucumber:install --rspec --capybara

compass init rails -r ninesixty --using 960

rm public/index.html
rm public/images/rails.png

rm app/views/layouts/application.html.erb

rails g nifty:layout --haml


