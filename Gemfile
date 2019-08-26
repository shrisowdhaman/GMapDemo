source 'https://rubygems.org'


gem "rails", ">= 3.2.17"



# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

#AUTHENDICATION
gem 'authlogic'
gem 'rails3-generators' # for the authlogic generators
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end

group :test do
    gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
    gem "factory_girl_rails", ">= 3.3.0", :group => [:development, :test]
    gem "email_spec", ">= 1.2.1", :group => :test
    gem "accept_values_for"
end
gem 'jquery-rails'


group :development do
  gem 'capistrano'
  gem 'capistrano-unicorn'
  gem 'capistrano-file_db'
  gem 'rvm-capistrano'
end

# To Google Map
gem 'gmaps4rails', '1.4.8'

# to upload the image
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
