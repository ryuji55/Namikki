class StaticPagesController < ApplicationController
  def top
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=Tahara&appid=#{Rails.application.credentials.weather[:api_key]}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    result["weather"]
    @main = result["weather"][0]["main"]
    @description = result["weather"][0]["description"]
    @icon = result["weather"][0]["icon"]
  end
end
