require "rails_helper"

describe DarkskyService do
  it 'gets weather data' do
    coords = 'denver,co'
    service = DarkskyService.new(coords)

    results = service.get_weather_data

    expect(results).to be_an_instance_of(Hash)
    expect(results).to have_key("latitude")
  end
end
