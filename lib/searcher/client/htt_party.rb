module Searcher
  module Client
    class HttParty < Base
      def get(url)
        HTTParty.get(url)
      end
    end
  end
end
