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

    url = "#{config.base_url}/#{config.name}"

    Thread.new do
      Net::HTTP.post_form URI.parse(url), {}
    end

    true
  end

  class Config

    attr_accessor :name, :base_url

    def initialize
      @base_url = 'http://beatr.io'
    end

  end
end

