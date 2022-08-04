require 'net/http'

##
# Http Client responsible to consume from topics.
module ConsumerHttp

  def self.consume(topic, uri, port)
    client = Net::HTTP.get(URI(uri + ':' + port.to_s), { "topic" => topic })
    client
  end
end