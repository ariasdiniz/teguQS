require_relative 'broker/broker_starter'
require_relative 'consumer/consumer'
require_relative 'producer/producer'

##
# Module with factories for the TeguQS
# broker, producer and consumer.
module TeguQS
  ##
  # Start a new broker
  def self.start_broker
    BrokerStarter.run!
  end

  ##
  # Create a new instance of Consumer
  # @param topic String
  # @param uri String
  # @param port Int
  # @return Consumer
  def self.consumer(topic, uri = 'http://localhost', port = 4566)
    Consumer.new(topic, uri, port)
  end

  ##
  # Create a new instance of Producer.
  # @param topic String
  # @param uri String
  # @param port Int
  # @return Producer
  def self.producer(topic, uri = 'http://localhost', port = 4566)
    Producer.new(topic, port, uri)
  end
end
