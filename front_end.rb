require 'sinatra'
require 'slim'

get '/' do
  slim :index
  # get results for given image id or something
end

post '/' do
  # Check if image is in S3?
  # Check if results are in ElastiCache
  # put image in S3, add job to SQS
end

