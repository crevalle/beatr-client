require 'beatr/version'

module Beatr
  require 'net/http'

  def self.configure
    yield config
    config
  end

  def self.config
    @@config ||= Config.new
  end

  def self.beat name = config.name
    raise ArgumentError, 'please supply a beat name' if name.nil? || name == ''

    uri = URI.parse "#{config.host}/#{URI.escape name}"

    Thread.new do
      Net::HTTP.post_form uri, {}
    end

    true
  end

  class Config

    attr_accessor :name
    attr_reader :host

    def initialize
      @host = 'http://beatr.io'
    end

    def host= url
      if !url.include? 'http'
        @host = "http://#{url}"
      else
        @host = url
      end
    end

  end
end

