require "groovehq/client/tickets"

module GrooveHQ
  class Client

    include HTTParty
    include GrooveHQ::Client::Tickets
    
    base_uri "https://api.groovehq.com/v1"
    format :json

    def initialize(access_token = nil)
      access_token ||= ENV["GROOVEHQ_ACCESS_TOKEN"]
      self.class.default_options.merge!(headers: { "Authorization" => "Bearer #{access_token}" })
    end

    # def perform_request(path)
    #   url = "https://api.groovehq.com/v1/#{path}"
    #   response = HTTParty.get(url, headers: { "Authorization" => "Bearer #{@access_token}"})
    #   JSON.parse(response.body)
    # end
  end
end
