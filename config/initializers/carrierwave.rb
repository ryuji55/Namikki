require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: 'ap-northeast-1',
    path_style: true
  }
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_directory  = 'rails-namikki'
    config.storage = :fog
end
