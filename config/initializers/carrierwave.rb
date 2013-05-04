CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: AMAZON_CONFIG["id"],
    aws_secret_access_key: AMAZON_CONFIG["secret"]
  }
  config.fog_directory = AMAZON_CONFIG["bucket"]
end