require 'capistrano-db-tasks'

set :user, "astra"
role :app, %w{astra@167.99.191.197}
role :web, %w{astra@167.99.191.197}
role :db,  %w{astra@167.99.191.197}

server '167.99.191.197', roles: %w{web app db}

set :rails_env, :production
set :rake, 'bundle exec rake'
set :deploy_to, '/var/www/astra'
set :branch, 'dev'

set :puma_threads,    [4, 16]
set :puma_workers,    0
# set :unicorn_config_path, "#{shared_path}/config/unicorn.rb"
# set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :sidekiq_pid, "#{shared_path}/tmp/pids/sidekiq.pid"
set :sidekiq_log, "#{shared_path}/log/sidekiq.log"
set :sidekiq_config, "#{shared_path}/config/sidekiq.yml"
set :sidekiq_concurrency, 20
