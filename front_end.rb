require 'sinatra'
require 'slim'
require 'pry'
require 'digest' # for hashing image
require 'aws-sdk'

set :bind, '0.0.0.0'

bucket_name = 'cobo6449-images'
AWS.config(
  :access_key_id => '',
  :secret_access_key => '')

s3  = AWS::S3.new
sqs = AWS::SQS.new

queue = sqs.queues.create("alpr-work-queue")

get '/' do
  slim :index
end

post '/image' do
  tempfile = params["file"][:tempfile]
  image_hash = Digest::SHA1.file tempfile
  key = image_hash
  s3.buckets[bucket_name].objects[key].write(file: tempfile)
  queue.send_message(image_hash.to_s)
  # Check if results are in ElastiCache
end

def check_ElastiCache(image_hash)

end
