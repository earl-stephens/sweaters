require "rails_helper"

describe GoogleService do
  it 'gets lat and long' do
    service = GoogleService.new('denver,co')
    results = service.get_lat_long

    expect(results).to be_an_instance_of(String)
  end
end
