module Mw
  module Movie
    class ParseOmdbInput
      attr_accessor :input

      def initialize(input)
        @input = input.with_indifferent_access
      end

      def movie_attributes
        { title: input[:Title], year: input[:Year], poster_url: input[:Poster] }
      end

      def movie
        @movie ||= ::Movie.new(movie_attributes)
      end

      def self.call(input)
        new(input).movie
      end
    end
  end
end
