class NoTopicError < StandardError
  def initialize(msg = "The specified topic doesn't exist")
    super
  end
end
