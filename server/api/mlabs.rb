require 'grape'

module Mlabs
  class BlahApi < Grape::API
    version 'v1' 
    format 'json'

    get 'ping' do
      {message: 'pong!'}
    end

    post 'parking' do
      parking = Parking.new(plate: params[:plate] )
      if parking.save
        parking
      else
        status 422
        {errors: parking.errors}
      end
    end

    put 'parking/:id/out' do
      parking = Parking.find( params[:id] )

      parking.left = true

      if parking.save
        parking
      else
        status 422
        { errors: parking.errors }
      end
    end

    put 'parking/:id/pay' do
      parking = Parking.find( params[:id] )

      parking.paid = true

      if parking.save
        parking
      else
        status 422
        { errors: parking.errors }
      end
    end

    get 'parking/:plate' do
      Parking.where( plate: params[:plate] )
    end

  end
end