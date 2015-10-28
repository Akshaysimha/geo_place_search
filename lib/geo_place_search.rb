require 'uri'
require 'net/http'
require 'json'
require 'pry'

class GeoPlaceSearch
  def self.search_places(keyword, api_key)
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

  def self.search_places_around_zip(postal_code, keyword, api_key, radius=50000)
    uri = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:"+"#{postal_code}"+"&sensor=false")
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    places = JSON.parse(@response.body)
    place = places["results"].first
    latitude = place["geometry"]["location"]["lat"]
    longitude = place["geometry"]["location"]["lng"]

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
end