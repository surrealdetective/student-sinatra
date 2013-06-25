require 'bundler/capistrano'

set :application, "studentbody"
set :repository,  "git@github.com:surrealdetective/student-sinatra.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'alexau'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false


role :web, "192.34.58.253"                          # Your HTTP server, Apache/etc
role :app, "192.34.58.253"                          # This may be the same as your `Web` server

#this fixes strange ubuntu problems.
default_run_options[:pty] = true

# don't need databases right now...
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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