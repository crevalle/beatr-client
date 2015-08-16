require 'beatr/version'

module Beatr
  requre 'net/http'

  class ConfigurationError < StandardError; end

  def self.configure
    yield config
  end

  def self.config
    @@config ||= Config.new
  end

  def self.beat
    raise ConfigurationError if config.name.nil || config.name == ''

    url = "#{base_url}/#{config.name}"

    Thread.new do
      Net::HTTP.post URI.parse(url)
    end
  end

  def self.base_url
    'http://localhost:3000'
  end

  class Config

    attr_accessor :name

  end
end

