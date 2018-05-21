require 'net/http'

class HomeController < ApplicationController
  def index
    @db_connected = begin
      Animal.count
      true
    rescue ActiveRecord::ActiveRecordError
      false
    end

    @tp_connected = begin
      api_host = ENV.fetch("API_HOST", "localhost:3001")
      api_host = "http://#{api_host}" unless api_host.start_with?("http://")
      uri = URI(api_host)
      Net::HTTP.get(uri) == "hello from node\n"
    rescue
      false
    end
  end
end
