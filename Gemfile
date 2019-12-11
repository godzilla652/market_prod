source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'

gem 'active_storage-send_zip'
gem 'activerecord-postgis-adapter'
gem 'activestorage-validator'
gem 'ancestry'
gem 'autoprefixer-rails'
gem 'best_in_place', '~> 3.0.1'
gem 'blueprinter'
gem 'bootsnap'
gem 'bootstrap-glyphicons'
gem 'bootstrap-sass'
gem 'cancancan'
gem 'city-state'
gem 'coffee-rails'
gem 'compass-rails', github: 'Compass/compass-rails'
gem 'concurrent-ruby', require: 'concurrent'
gem 'devise'
gem 'dotenv-rails'
gem 'faraday'
gem 'gcm'
gem 'geocoder'
gem 'geokit'
gem 'gmail'
gem 'gmaps4rails'
gem 'haml-rails'
gem 'image_processing', '~> 1.2'
gem 'interactor-rails', '~> 2.0'
gem 'intuit-oauth'
gem 'jbuilder'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'non-stupid-digest-assets'
gem 'oj'
gem 'paperclip'
gem 'paypal-sdk-core', '~> 0.3.4'
gem 'paypal-sdk-permissions'
gem 'paypal-sdk-rest'
gem 'pdfkit'
gem 'pg', '~> 0.21'
gem 'puma'
gem 'rabl'
gem 'rack-ssl', require: 'rack/ssl'
gem 'rails', '~> 5.2.3'
gem 'rails-settings-cached'
gem 'rails_sortable', '1.2.1'
gem 'ransack'
gem 'redis-namespace'
gem 'rest-client'
gem 'rgeo'
gem 'rgeo-activerecord'
gem 'rswag'
gem 'sass-rails'
gem 'send_zip'
gem 'settingslogic'
gem 'sidekiq', '~> 4.1', '>= 4.1.4'
gem 'statistics2', '~> 0.54'
gem 'stripe', '~> 2.0' # 1.38
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier'
gem 'webpacker'
gem 'whenever', require: false
gem 'wkhtmltopdf-binary-edge', '~> 0.12.5-alpha0'
gem 'render_anywhere'
gem 'paper_trail'
gem 'aasm'
gem 'jwt'
gem 'fcm'
gem "pundit"
gem 'rspec-core'
gem 'remotipart', '~> 1.2'


# gem 'paypal-sdk-permissions'
# gem 'geocoder'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platform: :mri
  gem "brakeman"
end

group :production do
  gem 'appsignal'

  # gem 'capistrano',         require: false
  # gem 'capistrano-rvm',     require: false
  # gem 'capistrano-rails',   require: false
  # gem 'capistrano-bundler', require: false
  # gem 'capistrano3-puma',   require: false
  # gem 'pg'
  # gem 'capistrano-passenger', require: false, git: 'https://github.com/capistrano/passenger.git', branch: 'master'

  # gem 'paperclip-nginx-upload'
  gem 'unicorn'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-sidekiq'
  gem 'letter_opener'
  gem 'listen'
  gem 'meta_request'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-inline'
  gem 'pry-theme'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console', '>= 3.3.0'

  # Deployment
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-db-tasks', require: false
  # gem 'capistrano3-unicorn', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano-db-tasks', require: false
  # gem 'capistrano-passenger', require: false
  gem 'capistrano3-puma',   require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'json_spec'
  gem 'rspec'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers'
  gem 'shoulda-matchers-callbacks'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock', require: false
end
