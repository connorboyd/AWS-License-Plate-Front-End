require 'sinatra'
require 'slim'
require 'pry'
require 'digest' # for hashing image

get '/' do
  slim :index
end

post '/image' do
  tempfile = params["file"][:tempfile]
  image_hash = Digest::SHA1.file tempfile
  # Check if image is in S3?
  # Check if results are in ElastiCache
  # put image in S3, add job to SQS
end

