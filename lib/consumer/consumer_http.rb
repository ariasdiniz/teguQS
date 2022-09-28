# frozen_string_literal: true

require "net/http"

##
# Http Client responsible to consume from topics.
module ConsumerHttp
  def self.consume(topic, uri, port)
    Net::HTTP.get(URI("#{uri}:#{port}"), { "topic" => topic })
  end
end
