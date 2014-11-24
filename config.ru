# This file is used by Rack-based servers to start the application.
Bundler.require(*Rails.groups)

# Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

