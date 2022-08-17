require 'singly_linked_queue'
require_relative 'errors/no_topic_error'

##
# This module defines the operations the broker can realise.
module BrokerOperations

  ##
  # Receives an event from the producer and register it on the right topic.
  # If the topic doesn't exist, it creates the topic.
  # @param message String
  # @param topic String
  def add_message_to_queue(message, topic)
    if self.queues[topic].nil?
      self.queues[topic] = SinglyLinkedQueue::LinkedQueue.new
    end
    self.queues[topic].put(message)
  end

  ##
  # Sends the first message on the list of the specified topic to the consumer.
  # If the topic doesn't exist, returns an error.
  # @param topic String
  def send_to_listener(topic)
    begin
      if self.queues[topic].nil?
        raise NoTopicError
      end
      self.queues[topic].pop
    end
  end
end
