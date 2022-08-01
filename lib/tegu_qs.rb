require_relative 'broker/broker_starter'

module TeguQS
  def self.start_broker
    BrokerStarter.run!
  end
end
