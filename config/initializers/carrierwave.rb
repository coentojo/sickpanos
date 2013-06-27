CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJ6DIJ7DDMVTS6H5Q",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "sickpano"
end