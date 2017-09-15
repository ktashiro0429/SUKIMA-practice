CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJF6LBRAL4PIWEB3A',
    :aws_secret_access_key  => 'OuTVaMRv7yrVYwC2h7ek6oR+YLX6gTgM/ZudhzNJ',
    :region                 => 'chosen_region'
  }

  config.fog_directory = 'your_backet' if Rails.env.production?
  config.fog_directory = 'your_backet_for_dev' if Rails.env.development?

end