# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "nekotter"
# set :repo_url, "ssh://git@github.com:neko314/nekotter.git"
set :repo_url, "https://neko314:smile314@github.com/neko314/nekotter.git"
# set :repo_url, 'git@github.com:neko314/nekotter.git'
# set :repo_url, 'https://user_name:pass_word@github.com/user_name/web_app.git'

# set :repo_url, 'ssh://git@example.com:30000/~/me/my_repo.git'

set :assets_roles, [:web, :app]
set :conditionally_migrate, true
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }

# set :migration_role, :app


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/nekotter"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
# append :linked_files, %w{config/master.key}
append :linked_files, "config/master.key"
append :linked_files, "config/database.yml"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure



desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end
