S3_BUCKET_NAME = ENV['S3_BUCKET_NAME']
AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY']
AWS_ACCESS_KEY = ENV['AWS_ACCESS_KEY']

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: AWS_ACCESS_KEY,
    aws_secret_access_key: AWS_SECRET_ACCESS_KEY
  }
  config.fog_directory = S3_BUCKET_NAME
end