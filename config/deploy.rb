# config valid only for current version of Capistrano
lock '3.16.0'

set :application, 'new_app'
set :repo_url, 'git@github.com:me/new_app.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/new_app
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, '.env'

# Default value for linked_dirs is []
append :linked_dirs, 'log'

# Default value for default_env is {}
# set :default_env, { path: "/opt/crystal/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Kemal settings
set :kemal_env, 'production'

after 'deploy:publishing', 'kemal:restart'
