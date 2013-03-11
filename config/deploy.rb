require 'bundler/capistrano'
require "rvm/capistrano"

# Development server info
set :rvm_ruby_string, 'ruby-1.9.3-p286@global'
set :rvm_type, :system
set :application, "newclass.org"
set :scm, :git
set :repository,  "git@github.com:jexchan/re-education.git"
set :branch, 'master'
set :user, "root"
set :group, "root"
set :deploy_via, :remote_cache
set :keep_release, 3

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

server application, :app, :web, :db, :primary => true

# Deploy to multiple environments
desc "Run on staging server" 
task :staging do 
  set :deploy_to, "/var/www/#{application}/staging"
end 
 
desc "Run on production server" 
task :production do 
  set :deploy_to, "/var/www/#{application}/production"
end 

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
    run "nginx -s reload"
  end

  desc "Make symlink for database yaml"
  task :db_symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end

  desc "Make symlink for uploaded files"
  task :uploader_symlink do
    run "rm -rf #{latest_release}/public/uploads"
    run "ln -nfs #{shared_path}/public/uploads #{latest_release}/public/"
  end 
end

before "deploy:assets:precompile", 
       "deploy:db_symlink"

after "bundle:install", 
      "deploy:uploader_symlink"

desc "Backup SQL"
task :backup do 
  run "cd /root/sqlbackup" 
  run "backup perform --trigger newclass_backup -d . -c /root/sqlbackup/config.rb"
end 
