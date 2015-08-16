# Beatr::Gem

An easy way to send heartbeats to Beatr.io.  Makes asynchronous POST requests to the Beat of your choice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beatr-gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beatr-gem

## Usage

Set the Beat name: `Beatr.config.name = 'gorbypuff'`.  This will be visible at http://beatr.io/gorbypuff.

You can also use a block:
```
Beatr.configure do |c|
  c.name = 'gorbypuff'
end
```
Using Gorbypuff is optional.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/beatr-gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
