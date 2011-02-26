source :gemcutter
source "http://gems.github.com"

gem 'rails', '2.3.5'
gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'htmlentities', '4.0.0'
gem 'vpim', '0.695'
gem 'has_many_polymorphs', '2.13'
gem 'paper_trail', '1.6.5'
gem 'will_paginate', '2.3.15'
gem 'columnize', '0.3.2'
gem 'linecache', '0.43'
gem 'hpricot', '0.8.3'
gem 'rubyzip', '0.9.4', :require => 'zip/zip'
gem 'ri_cal', '0.8.5'
gem 'facets', '2.5.2', :require => false
gem 'lucene_query', :path => 'vendor/gems'

group :development,:test do
  gem 'vlad'
  gem 'vlad-git'
  gem 'rspec', '1.3.1'
  gem 'rspec-rails', '1.3.3'
end

group :preview,:production do
  gem 'thin'
end
