require "bundler/capistrano"

set :application, "testapp"
set :repository,  "git@github.com:boberetezeke/testapp-2-3-14.git"

set :scm, :git
set :scm_username, "boberetezeke"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "deploy@50.57.28.218", :web, :app, :db, :primary => true
#server "deploy@192.168.0.50", :web, :app, :db, :primary => true
#role :db,  "50.57.132.36", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/var/www/app/#{application}"
set :use_sudo, false

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "Default deploy - updated to run migrations"
  task :default do
    set :migrate_target, :latest
    update_code
    migrate
    symlink
    restart
  end
  
  desc "Deploy without migrations"
  task :without_migrations do
    update_code
    symlink
    restart
  end

  desc "Restart Phusion Passenger"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
