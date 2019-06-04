class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_wx, :hourly_wx, :daily_wx
end
