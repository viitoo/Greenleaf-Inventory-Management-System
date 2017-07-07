source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core gems
gem 'rails',         '~> 5.1.1'
gem 'pg',            '~> 0.19.0'
gem 'carrierwave',   '~> 1.0'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

gem 'cancancan'
gem 'coveralls'
gem 'devise'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'mini_magick'
# gem 'protected_attributes'
gem 'pundit'
gem 'seed_dump'
gem 'twitter-bootstrap-rails'
gem 'jquery-ui-rails'
gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'

group :development do
  gem 'spring-watcher-listen'
  gem 'letter_opener'
  gem 'web-console'
  gem 'listen'
  gem 'sextant'
  gem 'spring'
  gem 'letters', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'brakeman', require: false
end

group :test do
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'database_cleaner',        '~> 1.6', '>= 1.6.1'
  gem 'factory_girl_rails',      '~> 4.8'
  gem 'simplecov',               '~> 0.14.1', require: false
  gem 'shoulda-matchers',        '~> 3.1', '>= 3.1.1', require: false
  gem 'rails_best_practices',    '~> 1.18', '>= 1.18.1'
  gem 'rspec_candy',             '~> 0.4.1'
  gem 'rspec-rails',             '~> 3.6'
  gem 'rspec-activemodel-mocks', '~> 1.0', '>= 1.0.3'
  gem 'rails-controller-testing'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end
