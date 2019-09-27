require 'rspec'
require 'shoulda/matchers'
require 'support/request_helpers.rb'
require_relative '../config/environment.rb'

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.formatter = :documentation
  config.include Requests::BlahHelpers, type: :request

  config.before(:each) do
    Parking.delete_all
  end
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