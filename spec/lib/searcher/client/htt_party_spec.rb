describe Searcher::Client::HttParty do
  subject { described_class.new }

  describe "#get" do
    let(:url) { "MyUrl" }

    before do
      allow(HTTParty).to receive(:get)
    end

    it "calls HTTParty get method with given url" do
      subject.get(url)
      expect(HTTParty).to have_received(:get).with(url)
    end
  end
end
