class Movie
  attr_accessor :title, :year, :poster_url

  def initialize(title: nil, year: nil, poster_url: nil)
    @title = title
    @year = year
    @poster_url = poster_url
  end
end
