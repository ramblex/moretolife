set :application, "moretolife"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to,  "/home/alexd/public_html/#{application}"
set :deploy_via, :remote_cache

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :repository,  "ssh://git@174.143.244.92:30000/home/git/moretolife.git"
set :branch, "master"
set :user, "alexd"
ssh_options[:forward_agent] = true
set :port, 30000

role :app, "moretolife08.org.uk"
role :web, "moretolife08.org.uk"
role :db,  "moretolife08.org.uk", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true }  do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

  desc "Copy uploaded images from previous release"
  task :copy_prev_upload_dir do
    prev_uploads_dir = "#{previous_release}/public/images/events" rescue next
    run "[ -d #{prev_uploads_dir} ] && cp -R #{prev_uploads_dir}/* #{latest_release}/public/images/events/ || echo 'No previous uploads directory'"
  end

  desc "Copy uploaded resources from previous release"
  task :copy_prev_resource_dir do
    prev_uploads_dir = "#{previous_release}/public/resources" rescue next
    run "[ -d #{prev_uploads_dir} ] && cp -R #{prev_uploads_dir}/* #{latest_release}/public/resources/ || echo 'No previous uploads directory'"
  end

  desc "Link to production database.yml"
  task :link_to_database_yml do
    run "ln -nfs /home/alexd/database.yml #{release_path}/config/database.yml" 
  end
  after "deploy:update_code",  "deploy:copy_prev_upload_dir", 
  "deploy:link_to_database_yml", "deploy:copy_prev_resource_dir"
end
