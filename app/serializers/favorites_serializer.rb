class FavoritesSerializer

  def favorite_location_weather(user)
    results = []
    locations = get_locations(user)
    locations.each do |locale|
      results << get_weather(locale)
    end
    results
  end

  def get_locations(user)
    locations = user.favorites.map do |favorite|
      favorite.location
    end
  end

  def get_weather(location)
    WeatherSerializer.new(Weather.new(location))
  end

end
