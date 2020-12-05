module Presenters
  module Movie
    class Default < Presenters::Base
      delegate :title, :year, :poster_url, to: :object

      def as_json(_options = {})
        {
          title: title,
          year: year,
          poster_url: poster_url
        }
      end
    end
  end
end
