require 'spec_helper'

describe Mlabs::BlahApi do
	include Rack::Test::Methods

  
  context "Start application" do
    it 'server running' do
      get '/'
      expect( last_response.status ).to eq 404
    end

    it "sucessfully ping" do
      get '/v1/ping'

      expect( last_response.status ).to eq 200
      expect( 
        JSON.parse(last_response.body) 
      ).to eq JSON.parse(
        '{"message": "pong!"}'
      )
    end
  end
end