require 'rspec'
require 'capybara/rspec'
require 'shoulda/matchers'

require_relative '../config/environment.rb'

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.formatter = :documentation
end

Capybara.configure do |config|
  config.app = Mlabs::BlahApi
  config.server_port = 3000
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model

  end
end

def app
  Mlabs::BlahApi
end