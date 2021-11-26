CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    secret_key_base: Rails.application.credentials[:secret_key_base],
    region: 'ap-northeast-1'
  }

    config.fog_directory  = 'rails-namikki'
    config.cache_storage = :fog
end
