require_relative 'broker/broker_starter'
require_relative 'consumer/consumer'
require_relative 'producer/producer'

module TeguQS
  def self.start_broker
    BrokerStarter.run!
  end

  def self.consumer(topic, uri = 'http://localhost', port = 4566)
    Consumer.new(topic, uri, port)
  end

  def self.producer(topic, uri = 'http://localhost', port = 4566)
    Producer.new(topic, port, uri)
  end
end
