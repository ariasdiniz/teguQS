require_relative 'broker_operations'

##
# Class that represents the broker
class Broker
  include BrokerOperations
  ##
  # The list of topics the broker is taking care of.
  attr_accessor :queues

  ##
  # Creates a new broker.
  # @return Broker
  def initialize
    @queues = Hash.new
  end
end
