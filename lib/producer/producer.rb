require_relative 'producer_http'

class Producer
  attr_accessor :topic, :port, :uri

  def initialize(topic, port=4566, uri="http://localhost")
    @topic = topic
    @port = port
    @uri = uri
  end

  def send_with_callback(message)
    begin
      ProducerHttp::send(message, @uri, @port, @topic)
    rescue => e
      e.message
    end
  end
end
