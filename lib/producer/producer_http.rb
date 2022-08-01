require 'net/http'
require 'json'

module ProducerHttp

  def self.send(message, uri, port, topic)
    base_header = {"topic" => topic}
    client = Net::HTTP.post(URI(uri + ':' + port.to_s), message, base_header)
    client.body
  end
end
