require 'yaml'

begin
  path = File.join(File.dirname(__FILE__), '..', 'config.yml');
  APP_ENV_CFG = YAML.load_file(path)[ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development']
  APP_GLOBAL_CFG = YAML.load_file(path)['global']
rescue StandardError => e
end
