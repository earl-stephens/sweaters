class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def formatted_url
    results = get_data_from_service
    results = results["hits"][0]["largeImageURL"]
  end

  def get_data_from_service
    PixabayService.new(@location).get_image_url
  end

end
