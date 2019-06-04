class Weather
  attr_reader :id,
              :current_wx,
              :hourly_wx,
              :daily_wx

  def initialize(location)
    @id = location
    @location = location
    @current_wx = current_conditions
    @hourly_wx = hourly_conditions
    @daily_wx = daily_conditions
  end

  def current_conditions
    weather_facade.current
    # {"temp" => 71, "dew" => 75}
  end

  def hourly_conditions
    # weather_facade.hourly
    {"temp" => 71, "dew" => 75}
  end

  def daily_conditions
    # weather_facade.daily
    {"temp" => 71, "dew" => 75}
  end

  def weather_facade
    weather_data = WeatherFacade.new(@location)
  end
end
