source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 4.1.20'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'execjs'
gem 'duktape'
# User duktape instead of therubyracer ? See in prod !
# gem 'therubyracer',  platforms: :ruby

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
#gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'bcrypt', '~> 3.1.12'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# useless gem :
# gem 'rake', '12.3.0'
# gem 'coffee-rails', '~> 4.2'

# Additional gems
gem 'jquery-rails', '~> 4.3.3'
gem 'jquery-ui-rails', '~> 5.0.5'
gem 'twitter-bootstrap-rails', '~> 3.2.0'
gem 'select2-rails', '~> 4.0.3'
gem 'will_paginate', '~> 3.1.7'
gem 'carrierwave', '~> 1.3'
gem 'photoswipe-rails', '~> 4.1'
gem 'mini_magick', '~> 4.9'
