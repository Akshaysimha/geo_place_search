require 'uri'
require 'net/http'
require 'json'

class GeoPlaceSearch
  def self.search_places(keyword, api_key)

    parse_json('https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{keyword}&key=#{api_key}')
    uri = URI.parse("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{keyword}&key=#{api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    places = JSON.parse(@response.body)
    search_results = []
    places["results"].each do |p|
      search_results << p
    end
    search_results
  end

  def self.palce_lat_and_log(postal_code)
    position = []
    uri = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:"+"#{postal_code}"+"&sensor=false")
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    places = JSON.parse(@response.body)
    place = places["results"].first
    latitude = place["geometry"]["location"]["lat"]
    position << latitude
    longitude = place["geometry"]["location"]["lng"]    
    position << longitude

    position
  end

  def self.search_places_around_zip(postal_code, keyword, api_key, radius=50000)

    pos = self.palce_lat_and_log(postal_code)
    latitude = pos.first
    longitude = pos.last
    uri = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{radius}&keyword=#{keyword}&key=#{api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    places = JSON.parse(@response.body)
    search_results = []
    places["results"].each do |p|
      search_results << p
    end
    search_results
  end

  private

  def parse_json(api)
    uri = URI.parse(api)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)  
  end
end