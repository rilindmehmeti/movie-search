describe Mw::Movie::ParseOmdbInput do
  let(:input) { { Title: "Game of Thrones", Year: "2010", Poster: "Poster" } }

  subject { described_class.new(input) }

  describe ".initialize" do
    context "with input" do
      it "doesn't throw error" do
        expect { subject }.not_to raise_error
      end

      context "with nil input" do
        let(:input) { nil }
        it "throws NoMethodError" do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context "without input" do
      subject { described_class.new }
      it "throws ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#movie_attributes" do
    context "with all attributes" do
      it "maps all the attributes" do
        expect(subject.movie_attributes).to eq(title: "Game of Thrones", year: "2010", poster_url: "Poster")
      end
    end

    context "with partial attributes" do
      let(:input) { { Title: "Game of Thrones", Year: "2010" } }

      it "maps only matched attributes" do
        expect(subject.movie_attributes).to eq(title: "Game of Thrones", year: "2010", poster_url: nil)
      end
    end
  end

  shared_examples "movie related examples" do
    it "returns a movie" do
      expect(movie).to be_a(Movie)
    end

    context "with all attributes" do
      it "sets all the attributes" do
        expect(movie.title).to      eq("Game of Thrones")
        expect(movie.year).to       eq("2010")
        expect(movie.poster_url).to eq("Poster")
      end
    end

    context "with partial attributes" do
      let(:input) { { Title: "Game of Thrones", Year: "2010" } }

      it "sets only matched attributes" do
        expect(movie.title).to      eq("Game of Thrones")
        expect(movie.year).to       eq("2010")
        expect(movie.poster_url).to be_nil
      end
    end
  end

  describe "#movie" do
    let(:movie) { subject.movie }

    include_examples "movie related examples"
  end

  describe ".call" do
    let(:movie) { described_class.call(input) }

    include_examples "movie related examples"
  end
end
