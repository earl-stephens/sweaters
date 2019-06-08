class Background
  attr_reader :url,
              :id

  def initialize(location)
    @location = location
    @id = location
    @url = get_image
  end

  def get_image
    BackgroundFacade.new(@location).formatted_url
  end

end
