require "rails_helper"

describe DarkskyService do
  it 'gets weather data' do
    coords = '28.0345,-80.5887'
    service = DarkskyService.new(coords)

    response = service.get_weather_data

    results = JSON.parse(response.body)
    expect(results).to be_an_instance_of(Hash)
    expect(results).to have_key("latitude")
  end
end
