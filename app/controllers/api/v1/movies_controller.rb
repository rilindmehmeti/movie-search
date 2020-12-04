module Api
  module V1
    class MoviesController < ApplicationController
      def search
        movies = Mw::Movie::Search.call(search_term: params[:search_term])
        render status: :ok, json: { movies: movies }
      rescue Searcher::Errors::ApiError => e
        render status: :unprocessable_entity, json: { error: e.message }
      end
    end
  end
end
