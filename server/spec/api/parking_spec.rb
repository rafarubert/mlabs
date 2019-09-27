require 'spec_helper'

describe Mlabs::BlahApi, type: :request do
  include Rack::Test::Methods

  context "Parking endpoints" do
    
    context "create" do
      it "Create new parking data" do
      
        parking_data = { plate: "FAA-1234" }
        
        post '/v1/parking', parking_data
  
        expect( last_response.status ).to eq 201
  
        expect( json['plate'] ).to eq "FAA-1234"
        
      end

      it "Not create parking data" do
        parking_data = JSON.parse( '{"plate": ""}' )
  
        post '/v1/parking', parking_data
        
        expect( last_response.status ).to eq 422
  
        expect( json['errors']['plate'] ).to include "can't be blank"
      end
  
      it "Not create parking with wrong plate" do
        parking_data = JSON.parse( '{"plate": "3333-3334"}' )
  
        post '/v1/parking', parking_data
        
        expect( last_response.status ).to eq 422
  
        expect( json['errors']['plate'] ).to include "only valid plate"
      end
  
    end

    context "update" do
      it "Update plate for out with paid" do

        parking = Parking.create(plate: "AAA-3333", paid: true )

        put "/v1/parking/#{parking.id}/out"
  
        expect( last_response.status ).to eq 200
        expect( json['left'] ).to eq true  
        expect( json['plate'] ).to eq "AAA-3333"
      end

      it "Update plate for out without paid" do

        parking = Parking.create( plate: "AAA-3333" )

        put "/v1/parking/#{parking.id}/out"
  
        expect( last_response.status ).to eq 422

        expect( json['errors']['left'] ).to include "permited only after paid"
      end
    end

    it "Update plate for pay" do
      parking = Parking.create( plate: "AAA-3333" )

      put "/v1/parking/#{parking.id}/pay"

      expect( last_response.status ).to eq 200

      expect( json['plate'] ).to eq "AAA-3333"
      expect( json['paid'] ).to eq true
    end

    it "Get history per plate" do
      allow( Time ).to receive(:now).and_return(
        Time.parse("2019-09-27 09:40:13")
      )

      parking = Parking.create( plate: "AAA-3333" )

      allow( Time ).to receive(:now).and_return(
        Time.parse("2019-09-27 09:40:13") + 25.minute
      )

      get "/v1/parking/#{parking.plate}"

      expect( last_response.status ).to eq 200

      expect( json.count ).to be > 0
      expect( json[0]['plate'] ).to include "AAA-3333"
      expect( json[0]['time'] ).to include "25 minutes"
    end
  end
end