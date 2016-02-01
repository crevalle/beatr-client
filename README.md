# Pulse

An easy way to send heartbeats to https://pulse.crevalle.io.  Makes asynchronous POST requests to the Heartbeat of your choice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crevalle-pulse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crevalle-pulse

## Usage

Drop in your api key:

```ruby
# config/initializers/pulse.rb

Crevalle::Pulse.config.api_key = 'your-api-uuid'
```

You're ready to send heartbeats!  Anywhere in your code, such as when a user signs up, call 

```ruby
Crevalle::Pulse.beat 'myapp.user-signup'
```
to send a beat to the Pulse server.  This request runs in a separate thread, so you can drop the notification into your normal codepaths without worrying about performance.


© 2015 Crevalle Technologies, LLC
