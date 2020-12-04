module Mw
  module Movie
    class Search
      attr_reader :search_term

      def initialize(search_term:)
        @search_term = search_term
      end

      def call
        raw_movies = Searcher::Omdb.new(search_term: search_term).result
        raw_movies.map { |movie| ParseOmdbInput.call(movie) }
      end

      def self.call(search_term:)
        new(search_term: search_term).call
      end
    end
  end
end
