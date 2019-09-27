require 'json'

module Requests
  module BlahHelpers
    def json
      JSON.parse( last_response.body ) 
    end
  end
end