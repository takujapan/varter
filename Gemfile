source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass'
gem 'faker'
gem 'jquery-rails'
gem 'will_paginate',           '3.1.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave',             '1.2.2'
gem "mini_magick",             '>= 4.9.4'
gem 'ransack'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'mysql2', '>= 0.4.4', '< 0.6.0'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rubocop-airbnb'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'fog', '1.42'
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
