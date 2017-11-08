require 'net/http'

class GoogleService

  def initialize
    @uri =  URI("https://www.googleapis.com/plus/v1/people?query=turing+school+of+software&key=#{ENV["GOOGLE_API_KEY"]}")
  end

  def parsed_json
    get_response["items"]
  end

  def get_response
    resp = Net::HTTP.get(@uri)
    JSON.parse(resp, symbolize_headers: true)
  end


end
