# frozen_string_literal: true

require "net/http"
require "json"

##
# Http service responsible of producing to topics.
module ProducerHttp
  def self.send(message, uri, port, topic)
    base_header = { "topic" => topic }
    client = Net::HTTP.post(URI("#{uri}:#{port}"), message, base_header)
    client.body
  end
end
