require 'spec_helper'
require 'webmock'
require 'pry'

describe "Fetch the serach results from the api" do 
  it "should return serach results from the api" do
    keyword = "mysore"
    api_key = "AsDeCRFTfghRThrt_asfdswere2343"

    stub_request(:get, "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{keyword}&key=#{api_key}").to_return(:status => 200, :body => "{\"results\" : [{\"formatted_address\" : \"Sayyaji Rao Rd, Mysuru, Karnataka 570001, India\"}]}")
    expect(GeoPlaceSearch.search_places(keyword, api_key)).to eq([{"formatted_address"=>"Sayyaji Rao Rd, Mysuru, Karnataka 570001, India"}])
  end
end