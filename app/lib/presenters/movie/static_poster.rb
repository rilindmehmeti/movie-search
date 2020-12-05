module Presenters
  module Movie
    class StaticPoster < Default
      def as_json(_options = {})
        {
          title: title,
          year: year,
          poster_url: "https://static.wixstatic.com/media/84428b_aec5877604ff494295b3af5af0b27a67~mv2.png"
        }
      end
    end
  end
end
