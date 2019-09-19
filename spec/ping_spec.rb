require 'spec_helper'


describe Mlabs::BlahApi, :type => :feature do
	include Rack::Test::Methods

	def app
		Mlabs::BlahApi
  end
  
  context "Routes" do
    it 'server running' do
      get '/'
      last_response.status.should == 404
    end

    it "sucessfully ping" do
      get '/v1/ping'

      last_response.status.should == 200

      visit '/v1/ping'

      expect(page).to have_content 'pong!'
    end
  end
end