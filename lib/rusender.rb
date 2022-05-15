require 'faraday'
require 'forwardable'
require 'json'
require 'ostruct'

require 'rusender/blank_query'
require 'rusender/client'
require 'rusender/collection'
require 'rusender/list'
require 'rusender/message'
require 'rusender/parameter'
require 'rusender/recipient'
require 'rusender/recipients_import'
require 'rusender/response'
require 'rusender/version'

# Base namespace
module RuSender
  using BlankQuery

  class << self
    attr_accessor :api_token

    def configure
      yield(self) if block_given?
    end

    def client
      @client ||= begin
                    token = ENV['RUSENDER_API_TOKEN'] || api_token

                    raise Error, 'RuSender api token is blank' if token.blank?

                    Client.new(token)
                  end
    end
  end
end
