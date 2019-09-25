require 'grape'


module Mlabs
  class BlahApi < Grape::API
    version 'v1' 
    format 'json'

    get 'ping' do
      {message: 'pong!'}
    end

    post 'parking' do
      {id: 1}
    end

    put 'parking/:id/out' do
      {id: 1}
    end

    put 'parking/:id/pay' do
      {id: 1}
    end

    get 'parking/:plate' do
      [{ id: 42, time: '25 minutes', paid: true, left: false }]
    end

  end
end