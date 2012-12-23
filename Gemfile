source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'mootools-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'capistrano'
gem 'devise'
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'

group :assets do
  gem 'sass-rails', '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production, :development do
  gem 'pg'
end

group :production do

end

group :development do

end

group :test do
  gem 'sqlite3'
  # to use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  # pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
