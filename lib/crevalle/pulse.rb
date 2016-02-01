require 'crevalle/pulse/version'

module Crevalle
  module Pulse
    require 'net/http'
    require 'json'

    def self.configure
      yield config
      config
    end

    def self.config
      @@config ||= Config.new
    end

    def self.beat name
      raise ArgumentError, 'please supply a beat name' if name.nil? || name == ''
      raise 'Please configure with an api key' if config.api_key.nil?

      uri = URI.parse "#{config.host}#{config.endpoint}"
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new uri.request_uri
      request.body = { 'beat' => name }.to_json

      request['Content-Type'] = 'application/json'
      request['X-API-KEY' ] = config.api_key

      Thread.new do
        http.request request
      end

      true
    end

    class Config
      attr_accessor :name
      attr_accessor :api_key
      attr_reader :host

      def initialize
        @host = 'https://pulse.crevalle.io'
      end

      def host= url
        if !url.include? 'http'
          @host = "http://#{url}"
        else
          @host = url
        end
      end

      def endpoint
        '/api/v1/beats'
      end
    end
  end
end

