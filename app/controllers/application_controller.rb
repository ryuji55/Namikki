class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :get_api, :require_login

  private

  def not_authenticated
    redirect_to main_app.login_path, warning: 'ログインしてください'
  end

  def get_api
    uri = URI.parse("https://api.openweathermap.org/data/2.5/forecast?id=1851259&lang=ja&units=metric&appid=#{Rails.application.credentials.weather[:api_key]}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    @lists = result["list"]
  end
end
