class StaticPagesController < ApplicationController
  def top
    uri = URI.parse("https://api.openweathermap.org/data/2.5/forecast?id=1851259&lang=ja&appid=#{Rails.application.credentials.weather[:api_key]}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    @lists = result["list"]
   # @weather_main = result["list"][0]["weather"][0]["main"]
   # @weather_description = result["list"][0]["weather"][0]["description"]
   # @weather_icon = result["list"][0]["weather"][0]["icon"]
   # @weather_date = result["list"][0]["dt_txt"]
  end
end
