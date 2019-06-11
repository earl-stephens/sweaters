class FavoritesSerializer

  def favorite_location_weather(user)
    Rails.cache.fetch("#{user}/get_data", :expires_in => 15.minutes) do
    results = []
    locations = get_locations(user)
    locations.each do |locale|
      results << get_weather(locale)
    end
    results
  end
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
