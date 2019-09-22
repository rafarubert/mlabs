require 'grape'


module Mlabs
  class BlahApi < Grape::API
    version 'v1' 
    format 'json'

    get 'ping' do
      {message: 'pong!'}
    end
  end
end