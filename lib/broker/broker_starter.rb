require 'sinatra'
require 'json'
require_relative 'broker'

set port: 4566

broker = Broker.new

post '/' do
  content_type :json
  received_body = JSON.parse(request.body.read)
  topic = request.env["HTTP_TOPIC"]
  broker.add_message_to_queue(received_body, topic)
  JSON.generate({ status: 'Success' })
end