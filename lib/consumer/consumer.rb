require_relative 'consumer_http'
require 'json'

class Consumer

  def initialize(topic, uri = 'http://localhost', port = 4566)
    @topic = topic
    @uri = uri
    @port = port
  end

  def consume
    body = "null"
    loop do
      if body == 'null' or body == '{"error":"The specified topic doesn\'t exist"}'
        sleep(2)
      end
      body = ConsumerHttp::consume(@topic, @uri, @port)
      unless body == "null"
        yield(JSON.parse(body))
      end
    end
  end
end
