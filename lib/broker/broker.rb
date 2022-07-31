require_relative 'broker_operations'

class Broker
  include BrokerOperations
  attr_accessor :queues

  def initialize
    @queues = Hash.new
  end
end
