module Searcher
  class Omdb
    API_KEY_FIELD = "OMDB_API_KEY".freeze

    def token
      @token ||= ENV[API_KEY_FIELD]
    end
  end
end
