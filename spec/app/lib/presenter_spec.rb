describe Presenter do
  let(:object) { Movie.new(title: "Title", year: "2010", poster_url: "MyPoster") }

  subject { described_class.new(object) }

  describe ".initialize" do
    context "with supported params" do
      context "with object" do
        it_behaves_like "without initialization errors"

        context "with presenter" do
          subject { described_class.new(object, presenter: :default) }
          it_behaves_like "without initialization errors"
        end
      end
    end

    context "without params" do
      subject { described_class.new }
      it_behaves_like "with initialization errors"
    end

    context "with unsupported params" do
      subject { described_class.new(object, my_presenter: :default) }
      it_behaves_like "with initialization errors"
    end
  end

  describe "#call" do
    subject { described_class.new(object).call }
    context "with single object" do
      context "with an instance of Movie" do
        it "returns a default movie presenter" do
          expect(subject).to be_a(Presenters::Movie::Default)
        end
      end

      context "with a number" do
        let(:object) { 2 }
        it "returns a base presenter" do
          expect(subject).to be_a(Presenters::Base)
        end
      end
    end

    context "with collection" do
      subject { described_class.new([object, 1]).call }
      it "returns correct presenters for given objects" do
        expect(subject.length).to eq(2)
        expect(subject[0]).to     be_a(Presenters::Movie::Default)
        expect(subject[1]).to     be_a(Presenters::Base)
      end
    end
  end
end
