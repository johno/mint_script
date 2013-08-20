class ImageUploadController < ApplicationController

  def sign_put
    objectName = params[:s3_object_name]
    mimeType = params['s3_object_type']
    expires = Time.now.to_i + 100 # PUT request to S3 must start within 100 seconds

    amzHeaders = "x-amz-acl:public-read" # set the public read permission on the uploaded file
    stringToSign = "PUT\n\n#{mimeType}\n#{expires}\n#{amzHeaders}\n/#{S3_BUCKET_NAME}/#{objectName}";
    sig = CGI::escape(Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', S3_SECRET_KEY, stringToSign)))

    {
      signed_request: CGI::escape("#{S3_URL}#{S3_BUCKET_NAME}/#{objectName}?AWSAccessKeyId=#{S3_ACCESS_KEY}&Expires=#{expires}&Signature=#{sig}"),
      url: "http://s3.amazonaws.com/#{S3_BUCKET_NAME}/#{objectName}"
    }.to_json
  end
end
