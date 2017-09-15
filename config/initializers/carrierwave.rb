require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?

CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJF6LBRAL4PIWEB3A',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = ENV['S3_BUCKET_NAME']
    config.fog_public = true
  end
else
     CarrierWave.configure do |config|
    config.storage = :file
  end
end