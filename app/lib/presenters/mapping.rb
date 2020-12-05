module Presenters
  module Mapping
    MAPPING = {
      Movie: {
        default: "Presenters::Movie::Default",
        static: "Presenters::Movie::StaticPoster"
      }
    }.freeze
  end
end
