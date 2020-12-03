module Searcher
  class Omdb
    API_KEY_FIELD = "OMDB_API_KEY".freeze
    BASE_API_URL  = "http://www.omdbapi.com".freeze

    attr_reader :client, :adapter, :search_term, :response

    def initialize(search_term:, adapter: nil)
      @search_term = search_term
      @client = ResolveClient.new(adapter: adapter).client
    end

    def api_key
      @api_key ||= ENV[API_KEY_FIELD]
    end

    def search_url
      @search_url ||= "#{BASE_API_URL}/?s=#{search_term}&apikey=#{api_key}"
    end

    def search
      client.get(search_url)
    end

    def result
      @response ||= search
      raise Searcher::Errors::ApiError, response["Error"] if response["Response"] == "False"

      response["Search"]
    end
  end
end
