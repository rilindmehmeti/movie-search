describe Mw::Movie::Search do
  let(:search_term) { "game" }

  subject { described_class.new(search_term: search_term) }

  describe ".initialize" do
    context "with all required params" do
      it "doesn't throw error" do
        expect { subject }.not_to raise_error
      end
    end

    shared_examples "with errors" do
      it "throws ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with extra params" do
      subject { described_class.new(search_term: search_term, other_param: "MyExtraParam") }

      include_examples "with errors"
    end

    context "without params" do
      subject { described_class.new }

      include_examples "with errors"
    end
  end

  describe ".call" do
    let(:stubbed_searcher_result) do
      [
        { Title: "Game of Thrones", Year: "2010", Poster: "Poster" },
        { Title: "Game of Cards", Year: "2008", Poster: "Poster2" }
      ]
    end

    before do
      allow_any_instance_of(Searcher::Omdb).to receive(:result).and_return(stubbed_searcher_result)
    end

    let(:movies) { described_class.call(search_term: search_term) }

    it "returns a collection of movies" do
      expect(movies).to       be_a(Array)
      expect(movies.first).to be_a(Movie)
    end
  end
end
