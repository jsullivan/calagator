set :application, "bendcal"
set :user, "calagator"
set :domain, "#{user}@bendcal.org"

set :repository,  "git://github.com/broofa/calagator.git"

set :deploy_to, "/home/calagator/bendcal"

namespace :vlad do
  desc "Full deployment of BendCal"
  task "deploy" => %w[
    vlad:update
    vlad:migrate
  ]

  task :update do
    # Upload non-SCM'ed config files
    ENV['FILES'] = 'config/theme.txt, config/secrets.yml, config/geocoder_api_keys.yml'
    puts "Uploading " + ENV['FILES']
    Rake::Task['vlad:upload'].invoke
  end

  desc "Start solr server"
  remote_task :solr_start do
    run "cd #{current_path}; rake solr:start RAILS_ENV=#{rails_env}"
  end

  desc "Stop solr server"
  remote_task :solr_stop do
    run "cd #{current_path}; rake solr:stop RAILS_ENV=#{rails_env}"
  end
end

