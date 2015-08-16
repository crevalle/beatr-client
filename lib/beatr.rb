require 'beatr/version'

module Beatr
  require 'net/http'

  class ConfigurationError < StandardError; end

  def self.configure
    yield config
    config
  end

  def self.config
    @@config ||= Config.new
  end

  def self.beat
    raise ConfigurationError, 'please supply a beat name' if config.name.nil? || config.name == ''

    url = "#{base_url}/#{config.name}"

    Thread.new do
      Net::HTTP.post_form URI.parse(url), {}
    end

    true
  end

  def self.base_url
    'http://localhost:3000'
  end

  class Config

    attr_accessor :name

  end
end

