require 'singly_linked_queue'

module BrokerOperations
  def add_message_to_queue(message, topic)
    if self.queues[topic].nil?
      self.queues[topic] = SinglyLinkedQueue::LinkedQueue.new
    end
    self.queues[topic].put(message)
  end

  def send_to_listener(topic)
    self.queues[topic].pop
  end
end
