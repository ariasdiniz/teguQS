# TeguQS

A experimental gem to create brokers, producers and consumers for a message queue system.
It operates sending/consuming Strings in JSON format.
The broker uses [Sinatra](https://sinatrarb.com/).
## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add teguQS

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install teguQS

## Usage

### Notes

The consumer will run on loop, consuming messages from the desired topic.
Multiple consumers can consume from the same topic at the same time.
The "acknowledge" of the message is automatic; If no errors/exceptions are raised
inside the block passed by the consumer, the message will be considered "consumed".
Otherwise it will return to the topic queue.

### Starting a broker
```ruby
require 'tegu_qs'

TeguQS::start_broker
```

### Starting a consumer
```ruby
require 'tegu_qs'

consumer = TeguQS::consumer('test-topic')

consumer.consume do |message|
  puts message
end.join
```

### Producing to the topic
```ruby
require 'tegu_qs'

producer = TeguQS::producer('test-topic')
puts producer.send_with_callback('{"data":"testing producer"}')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ariasdiniz/teguQS. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ariasdiniz/teguQS/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TestTeguQS project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ariasdiniz/teguQS/blob/master/CODE_OF_CONDUCT.md).
