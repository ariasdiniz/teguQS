# frozen_string_literal: true

class InvalidMessageFormat < StandardError
  def initialize(msg = "Message format invalid. Please provide messages in JSON format.")
    super
  end
end
