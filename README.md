# geo_place_search

## Installation

`gem install geo_place_search`

## Usage

GeoPlaceSearch.search_places(keyword, api_key)

## returns the Json response of the google key word given


GeoPlaceSearch.search_places_around_zip("570004", "palace", "api_key", "radius")

##radius is optional, max radius is 50000 (in mtr). default is 50000 mtr


##example

[{"formatted_address"=>"Sayyaji Rao Rd, Mysuru, Karnataka 570001, India", "geometry"=>{"location"=>{"lat"=>12.305135, "lng"=>76.655148}}, "icon"=>"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png", "id"=>"24c7c7456d2f416e0781a6389a53e0e92082a8f9", "name"=>"Mysore Palace", "opening_hours"=>{"open_now"=>true, "weekday_text"=>[]}, "photos"=>[{"height"=>1356, "html_attributions"=>["<a href=\"https://maps.google.com/maps/contrib/117349624602169045453\">Phil Child</a>"], "photo_reference"=>"CmRdAAAAPTytfw6MSQ0YQKIyejMb9XnGe0Nv3M9aiSkqDnQoOtIc9E_XEEF4OiVFayqEqSn8Ne1lVHfFmVQFbvOwugE-lvtZy2Z5FIWQ0_-Bj-4z4hhkYPMLdbfCSS8XeiErUNSwEhCvRoYsGB_1QXQjseeutcyxGhQ9acynKhxoB7Lp_QNbMRrlW_lOVw", "width"=>2048}], "place_id"=>"ChIJ-aH5AxFwrzsRDdokoeK6f8M", "rating"=>4.5, "reference"=>"CnRhAAAAQzjaxHPb0-jGn9V5YOWElaB6lE0tyFh0olvDZxL6qbdp6CkAZATp9f-8VX2S8Dqa0VW6x5QlXhk4dDAuRTIMPdgdCRv1A51l6ulP4wX3osV8A3lRyqCXEyx3HGFfQv1DhLVqFJhCpSRG74X4SEIDkRIQ6cvwE4SRFSOrJRxy1XTr8RoUH7bEwQYb_komkLqFN2kRV_KXVRo", "types"=>["point_of_interest", "establishment"]}]

## Requirements

Ruby
