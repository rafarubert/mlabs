require 'spec_helper'
require 'capybara/rspec'

require_relative '../api/mlabs.rb'

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.formatter = :documentation
end

Capybara.configure do |config|
  config.app = Mlabs::BlahApi
  config.server_port = 3000
end

def app
  Mlabs::BlahApi
end