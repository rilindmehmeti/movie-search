module Searcher
  class ResolveClient
    attr_reader :adapter, :client

    def initialize(adapter: :httparty)
      @adapter = adapter.to_sym
      @client = @adapter.nil? ? default_client : set_client
    end

    private

    def default_client
      Client::HttParty.new
    end

    def set_client
      case adapter
      when :httparty
        Client::HttParty.new
      else
        raise Searcher::Errors::UnSupportedAdapter, "#{adapter} is not supported!"
      end
    end
  end
end
