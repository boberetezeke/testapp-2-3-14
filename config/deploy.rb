set :application, "testapp"
set :repository,  "git@github.com:boberetezeke/testapp-2-3-14.git"

set :scm, :git
set :scm_username, "boberetezeke"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#server "50.57.132.36", :web, :app, :db, :primary => true
role :web, "50.57.132.36"                          # Your HTTP server, Apache/etc
role :app, "50.57.132.36"                          # This may be the same as your `Web` server
role :db,  "50.57.132.36", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/home/stevetuckner/current"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
