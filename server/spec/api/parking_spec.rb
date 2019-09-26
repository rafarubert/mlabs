require 'spec_helper'

describe Mlabs::BlahApi do
  include Rack::Test::Methods

  context "Parking endpoints" do
    it "Create new parking data" do
      
      parking_data = JSON.parse( '{"plate": "FAA-1234"}' )
      
      post '/v1/parking', parking_data

      expect( last_response.status ).to eq 201

      expect( JSON.parse(last_response.body) ).to eq JSON.parse('{"id": 1}')
    end

    it "Update plate for out" do
      
      put '/v1/parking/:id/out'

      expect( last_response.status ).to eq 200

      expect( JSON.parse(last_response.body) ).to eq JSON.parse('{"id": 1}')
    end

    it "Update plate for pay" do
      
      put '/v1/parking/:id/pay'

      expect( last_response.status ).to eq 200

      expect( JSON.parse(last_response.body) ).to eq JSON.parse('{"id": 1}')
    end

    it "Get history per plate" do
      
      get '/v1/parking/:plate'

      history = '[{ "id": 42, "time": "25 minutes", "paid": true, "left": false }]'

      expect( last_response.status ).to eq 200

      expect( JSON.parse(last_response.body) ).to eq JSON.parse(history)
    end
  end
end