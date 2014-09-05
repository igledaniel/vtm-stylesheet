require 'aws-sdk'
require 'find'

desc "uploads the assets folder to s3"
task "upload" do
  AWS.config(
    access_key_id: ENV['AWS_KEY'],
    secret_access_key: ENV['AWS_SECRET']
  )
  s3 = AWS::S3.new
  bucket = s3.buckets['vector-styles.mapzen.com']
  Find.find('assets') do |path|
    if !FileTest.directory?(path)
      bucket.objects.create(path, File.read(path))
    end
  end
  
end
