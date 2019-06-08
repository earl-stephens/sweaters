require "rails_helper"

describe PixabayService do
  it 'can get an image url' do
    location = 'denver,co'
    service = PixabayService.new(location)

    results = service.get_image_url

    expect(results).to be_an_instance_of(Hash)
  end

  it 'can strip the location' do
    location = 'denver,co'
    service = PixabayService.new(location)

    expect(service.stripped_location).to eq('denver')
  end
end
