require 'sinatra'
require 'json'
require_relative 'broker'
require_relative 'errors/invalid_message_format'

##
# class that starts the broker server using Sinatra. The default port is 4566 and default server is localhost.
class BrokerStarter < Sinatra::Base
  set port: 4566

  broker = Broker.new

  post '/' do
    begin
      content_type :json
      received_body = JSON.parse(request.body.read)
      topic = request.env["HTTP_TOPIC"]
      broker.add_message_to_queue(received_body, topic)
      JSON.generate({ status: 'Success' })
    rescue
      JSON.generate({ error: "Message format invalid. Please provide messages in JSON format." })
    end
  end

  get '/' do
    begin
      content_type :json
      topic = request.env["HTTP_TOPIC"]
      JSON.generate(broker.send_to_listener(topic))
    rescue => e
      JSON.generate({ error: e.message })
    end
  end
end