require_relative 'producer_http'

##
# The producer implementation.
class Producer
  attr_accessor :topic, :port, :uri

  ##
  # The producer receives 3 arguments to initialize. The name of the topic,
  # the port and uri where the broker is hosted.
  # If the port and uri isn't specified, default is port = 4566 and uri = localhost
  # @param topic String
  # @param port Int
  # @param uri String
  def initialize(topic, port=4566, uri="http://localhost")
    @topic = topic
    @port = port
    @uri = uri
  end

  ##
  # This method receives a message (JSON formatted) to post in the topic.
  # Returns a string with success or error
  # @param message String
  # @return String
  def send_with_callback(message)
    begin
      ProducerHttp::send(message, @uri, @port, @topic)
    rescue => e
      return e.message
    end
    "Sent with success"
  end
end
