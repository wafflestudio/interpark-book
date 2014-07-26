require 'net/http'
require 'forwardable'
#require 'openssl'
require 'json'

module Interpark::Book
  class Configuration
    API_HOST="http://book.interpark.com"
    CONFIGURABLE_ATTRIBUTES=[
      :key
    ]

    attr_accessor *CONFIGURABLE_ATTRIBUTES

    def self.configurable_attributes
      CONFIGURABLE_ATTRIBUTES
    end

    def initialize(attrs = {})
      self.attributes = attrs
    end

    def attributes=(attrs = {})
      attrs.each { |key, value| instance_variable_set("@#{key}", value)  }
    end

    def http
      uri = URI.parse(API_HOST)
      @http ||= Net::HTTP.new(uri.host, uri.port)
      #@http.use_ssl = true
      #@http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @http
    end

    def data
      @data = {"key" => @key}
    end
  end

  class Client
    extend Forwardable

    APIS = {
      :search => {:method => "GET", :path => "/api/search.api"}
    }

    def_delegators :configuration, :credentials, *Configuration.configurable_attributes

    def initialize(attrs = {})
      self.configuration.attributes = attrs
    end

    def configure
      yield configuration if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def request(method, path, data)
      http = configuration.http
      data = configuration.data.merge(data)

      case method
      when "GET"
        get(http, path, data)
      when "POST"
        post(http, path, data)
      end
    end

    def get(http, path, data)
      data = URI.encode_www_form(data)
      resp, body = http.send_request("GET", "#{path}?#{data}")

      JSON.parse(resp.body)
    end

    def post(http, path, data)
      data = URI.encode_www_form(data)
      resp, body = http.send_request("POST", path, data)

      JSON.parse(resp.body)
    end

    def search(content, options)
      method = APIS[:search][:method]
      path = APIS[:search][:path]

      data = {"query" => content}
      data = data.merge(options)

      request(method, path, data)
    end
  end
end
