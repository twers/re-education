source 'http://ruby.taobao.org'

gem 'rails', '~> 3.2.2'
gem 'jquery-rails'
gem 'mailhopper'
gem 'compass'
gem 'compass-colors'
gem 'haml'
gem 'mysql2'
gem "ckeditor", "~> 3.7.2"
gem "paperclip"
gem "carrierwave"
gem "cancan"
gem 'rails_kindeditor', '~> 0.3.8'
gem 'dynamic_form'
gem "galetahub-simple_captcha", :require => "simple_captcha"
gem "rmagick"
# CanCan can not work perfectly with strong_parameters, will use slice pattern.
# TODO: Use strong_parameters when CanCan fix this issue.
#gem "strong_parameters"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass'
  gem 'compass-rails'
  gem "angular-rails", "~> 0.0.12"
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'gizmo'
  gem "rspec-rails", '~> 2.12.0'
  gem "factory_girl_rails", '~> 4.1.0'
  gem 'simplecov', :require => false
  gem 'capybara-webkit'
  gem 'headless'
  gem "shoulda-matchers", "~> 1.4.2"
end

group :development do
  gem 'rails_best_practices'
  gem 'debugger'
end

group :test, :development do
  gem 'term-ansicolor'
  gem 'jasmine', "~> 1.3.1"
  gem 'tddium'
  gem 'ruby-prof'
  gem "annotate", '~> 2.5.0'
end

group :production do
  gem 'pg'
end

