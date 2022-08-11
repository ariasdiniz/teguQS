require_relative "consumer_http"
require_relative "../producer/producer"
require "json"

class Consumer

  ##
  # The consumer receives 3 arguments to initialize. The name of the topic,
  # the port and uri where the broker is hosted.
  # If the port and uri isn't specified, default is port = 4566 and uri = localhost
  # @param topic String
  # @param port Int
  # @param uri String
  def initialize(topic, uri = "http://localhost", port = 4566)
    @topic = topic
    @uri = uri
    @port = port
  end

  ##
  # When this method starts, it enters a loop to consume from the specified topic.
  # It will execute the Block passed to this method on every iteration yielding
  # the block with the message from the topic. If any exception occur, the message will return
  # to the topic and not be "consumed"
  # Recommended to be used inside a Thread.
  def consume
    body = "null"
    acknowledge = Producer.new(@topic, @port, @uri)
    loop do
      if body == "null" or body == '{"error":"The specified topic doesn\'t exist"}'
        sleep(0.2)
      end
      body = ConsumerHttp::consume(@topic, @uri, @port)
      unless body == "null"
        begin
          yield(JSON.parse(body))
        rescue => e
          acknowledge.send_with_callback(body)
        end
      end
    end
  end
end
