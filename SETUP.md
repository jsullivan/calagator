## SSH key installation
  * Use ssh-keygen to create public/private DSA key pair
  * Login to bendcal.org as calagator
  * Copy/paste public key into authorized\_keys files
  * Logout of bendcal.org

## Set up local dev environment

  * sudo apt-get install sqlite3 libsqlite3-dev solr-common git-core ruby rubygems rake
  * sudo apt-get ruby-dev
  * sudo apt-get libopenssl-ruby # For "net/https" requires

  * sudo gem install vlad vlad-git
  * sudo gem install rails -v 2.3.4
  * sudo gem install hpricot
  * sudo gem install sqlite3-ruby

  * Follow calagator INSTALL.md instructions

  * After pulling calagaor source, be sure to do "sudo rake gems:install" to get all the gems you'll need

  * __NOTE__: You must *not* have the sqlite3 gem installed, otherwise db:migrate will fail

  * Get geocoder\_API.yml and secrets.yml files from one of the other devs (these aren't tracked in git)
