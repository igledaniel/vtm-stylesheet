require 'aws-sdk'
require 'find'

desc "uploads the assets folder to s3"
task "upload" do
  AWS.config(
    access_key_id: ENV['AWS_KEY'],
    secret_access_key: ENV['AWS_SECRET']
  )
  s3 = AWS::S3.new
  index_page = <<-EOM
<html>
<head>
<meta HTTP-EQUIV="REFRESH" content="0; url=https://github.com/mapzen/vtm-stylesheet"></html>" )
</head>
</html>
EOM
  bucket = s3.buckets['vector-styles.mapzen.com']
  bucket.objects.create("index.html", index_page)
  list_of_files = []
  Find.find('assets') do |path|
    if !FileTest.directory?(path)
      list_of_files << path
      bucket.objects.create(path, File.read(path))
    end
  end
  buckets.objects.create("manifest", list_of_files.join("\n"))
end
