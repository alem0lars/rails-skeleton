require "bundler/capistrano"
$LOAD_PATH.unshift File.join(File.join(File.dirname(File.dirname(__FILE__)), 'config'), 'initializers')
require 'load_config'

# ==> rvm bootstrap
$:.unshift(File.expand_path(APP_GLOBAL_CFG['rvm']['lib_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, "#{APP_GLOBAL_CFG['rvm']['ruby']}@#{APP_GLOBAL_CFG['rvm']['gemset']}"
set :rvm_type, :user

# ==> domain
set :domain, APP_GLOBAL_CFG['domain']

# ==> roles
#   app, web, db (primary) roles are in the same domain
server domain, :app, :web
role :db, domain, :primary => true
set :application, APP_GLOBAL_CFG['app']['name']

# ==> deploy
set :user, APP_GLOBAL_CFG['deployment']['user']
set :deploy_to, APP_GLOBAL_CFG['deployment']['private_path']

# ==> git
set :repository, APP_GLOBAL_CFG['repository']['url']
set :scm, :git
set :branch, "master"
set :scm_username, APP_GLOBAL_CFG['repository']['user']
set :git_enable_submodules, 1
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :scm_verbose, true
default_run_options[:pty] = true

# ==> ssh
ssh_options[:forward_agent] = true

# ==> dependencies
depend :remote, :gem, "bundler", "~>1.0"

# ==> misc
set :use_sudo, false

# ==> deploy task
namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

