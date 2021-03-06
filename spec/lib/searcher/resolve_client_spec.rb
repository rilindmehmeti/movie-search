describe Searcher::ResolveClient do
  subject { described_class.new(adapter: nil) }

  describe ".initialize" do
    context "without params" do
      subject { described_class.new }
      it_behaves_like "with initialization errors"
    end

    context "with adapter param" do
      context "with allowed adapter" do
        subject { described_class.new(adapter: :httparty) }
        it_behaves_like "without initialization errors"
      end

      context "with un allowed adapter" do
        subject { described_class.new(adapter: :http) }
        it "throws Searcher::Errors::UnSupportedAdapter" do
          expect { subject }.to raise_error(Searcher::Errors::UnSupportedAdapter)
        end
      end
    end

    context "with other params" do
      subject { described_class.new(param: :http) }
      it_behaves_like "with initialization errors"
    end
  end

  describe "#client" do
    shared_examples "Searcher::Client::HttParty instance" do
      it "returns an instance of Searcher::Client::HttParty" do
        expect(subject.client).to be_a(Searcher::Client::HttParty)
      end
    end

    context "without adapter param" do
      include_examples "Searcher::Client::HttParty instance"
    end

    context "with 'httparty' adapter" do
      include_examples "Searcher::Client::HttParty instance"
    end
  end
end
