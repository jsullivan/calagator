set :application,   "bendcal"
set :user,          "calagator"
set :domain,         "#{user}@bendcal.org"
set :repository,     "git://github.com/broofa/calagator.git"
set :deploy_to,      "/home/calagator/bendcal"
set :config_files,   ['database~custom.yml','theme.txt','secrets.yml','geocoder_api_keys.yml']

namespace :vlad do
  desc "Full deployment of BendCal"
  task "deploy" => %w[
    vlad:update
    vlad:migrate
  ]

  desc "Copy config files from shared/config to release directory"
  remote_task :copy_config_files do
    config_files.each do |filename|
      run "cp #{shared_path}/config/#{filename} #{release_path}/config/#{filename}"
    end
  end

  task :update do
    Rake::Task['vlad:copy_config_files'].invoke
  end

  task :start do
    Rake::Task['vlad:solr_start'].invoke
    Rake::Task['vlad:thin_start'].invoke
  end

  task :stop do
    Rake::Task['vlad:thin_stop'].invoke
    Rake::Task['vlad:solr_stop'].invoke
  end

  desc "Start thin server"
  remote_task :thin_start do
    run "cd #{current_path}; thin -d -e #{rails_env} start"
  end

  desc "Stop thin server"
  remote_task :thin_stop do
    run "cd #{current_path}; thin stop"
  end

  desc "Start solr server"
  remote_task :solr_start do
    run "cd #{current_path}; rake solr:start RAILS_ENV=#{rails_env} >& /dev/null"
  end

  desc "Stop solr server"
  remote_task :solr_stop do
    run "cd #{current_path}; rake solr:stop RAILS_ENV=#{rails_env} >& /dev/null"
  end
end

