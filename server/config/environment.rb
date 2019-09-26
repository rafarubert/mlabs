require 'json'
require 'bundler'

Bundler.require(:default, ENV['OTR_ENV'] ? ENV['OTR_ENV'].to_sym : :development)

OTR::ActiveRecord.configure_from_file! 'config/database.yml'

OTR::ActiveRecord.db_dir = '../db'
OTR::ActiveRecord.migrations_paths = ['../db/migrate']

require File.expand_path('application', __dir__)