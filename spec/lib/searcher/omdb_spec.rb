describe Searcher::Omdb do
  let(:object) { described_class.new(search_term: "myTerm") }
  subject { object }

  describe "API_KEY_FIELD" do
    it "should return OMDB_API_KEY" do
      expect(described_class::API_KEY_FIELD).to eq("OMDB_API_KEY")
    end
  end

  describe "BASE_API_URL" do
    it "should return http://www.omdbapi.com" do
      expect(described_class::BASE_API_URL).to eq("http://www.omdbapi.com")
    end
  end

  describe ".initialize" do
    shared_examples "initialization with errors" do
      it "throws ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    shared_examples "initialization without errors" do
      it "doesn't throw error" do
        expect { subject }.not_to raise_error
      end
    end

    context "without params" do
      let(:object) { described_class.new }
      include_examples "initialization with errors"
    end

    context "with params" do
      context "with supported params" do
        let(:object) { described_class.new(search_term: "MyTerm") }
        include_examples "initialization without errors"
      end

      context "with unsupported params" do
        let(:object) { described_class.new(my_param: "MyTerm") }
        include_examples "initialization with errors"
      end
    end
  end

  describe "#api_key" do
    it "returns configured api_key" do
      expect(object.api_key).to eq("a0b24f57")
    end
  end

  describe "#search_term" do
    before do
      allow(object).to receive(:api_key).and_return("myKey")
      allow(object).to receive(:search_term).and_return("mySearchTerm")
    end

    it "returns http://www.omdbapi.com/?s=mySearchTerm&apikey=myKey" do
      expect(subject.search_url).to eq("http://www.omdbapi.com/?s=mySearchTerm&apikey=myKey")
    end
  end

  describe "#search" do
    before do
      allow(subject.client).to receive(:get)
    end

    it "calls get method of searcher" do
      subject.search

      expect(subject.client).to have_received(:get).with(subject.search_url)
    end
  end

  describe "#result" do
    let(:stubbed_response) { {} }

    before do
      allow(subject).to receive(:search).and_return(stubbed_response)
    end

    context "without expected api error" do
      let(:stubbed_response) { { "Search": [] } }

      it "returns Search key of response" do
        expect(subject.result).to eq(stubbed_response["Search"])
      end
    end

    context "with expected api error" do
      let(:stubbed_response) { { "Response" => "False", "Error" => "MyError" } }

      it "throws Searcher::Errors::ApiError" do
        expect { subject.result }.to raise_error(Searcher::Errors::ApiError, "MyError")
      end
    end
  end
end
