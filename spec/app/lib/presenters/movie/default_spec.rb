describe Presenters::Movie::Default do
  let(:object) { Movie.new(title: "MyTitle", year: "2010", poster_url: "PosterUrl") }

  subject { described_class.new(object) }

  describe ".initialize" do
    context "with object" do
      it_behaves_like "without initialization errors"
    end

    context "without object" do
      subject { described_class.new }
      it_behaves_like "with initialization errors"
    end
  end

  shared_examples "call method examples" do
    it "gives the object as_json" do
      expect(subject).to eq({ title: "MyTitle", year: "2010", poster_url: "PosterUrl" }.as_json)
    end
  end

  describe "#call" do
    subject { described_class.new(object).call }
    include_examples "call method examples"
  end

  describe ".call" do
    subject { described_class.call(object) }
    include_examples "call method examples"
  end
end
