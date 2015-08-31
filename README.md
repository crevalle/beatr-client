# Beatr

An easy way to send heartbeats to Beatr.io.  Makes asynchronous POST requests to the Beat of your choice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beatr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beatr

## Usage

Set the Beat name: 

```ruby
# config/initializers/beatr.rb

Beatr.config.name = 'gorbypuff'.
```
You can also use a block:

```
Beatr.configure do |c|
  c.name = 'gorbypuff'
end
```

This will be visible to anyone listening at http://beatr.io/gorbypuff.

Then send a heartbeat by calling `Beatr.beat`.  You can change your Beats on fly by calling `Beatr.beat '<your-sweet-beat>'`.  This runs in a separate thread, so feel free to drop the notification into your normal codepaths without worrying about performance.

Using Gorbypuff is optional.


## Contributing

1. Fork it ( https://github.com/crevalle/beatr-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

© 2015 Crevalle Technologies, LLC 
