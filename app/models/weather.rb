class Weather
  attr_reader :current_wx,
              :hourly_wx,
              :daily_wx

  def initialize(location)
    @location = location
    @current_wx = current_conditions
    @hourly_wx = hourly_conditions
    @daily_wx = daily_conditions
  end

  def current_conditions
    weather_facade.current
  end

  def hourly_conditions
    weather_facade.hourly
  end

  def daily_conditions
    weather_facade.daily
  end

  def weather_facade
    weather_data = WeatherFacade.new(location)
  end
end
