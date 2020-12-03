describe Searcher::Client::Base do
  subject { described_class.new }

  shared_examples "errors" do
    it "raises RuntimeError" do
      expect { subject.get }.to raise_error(RuntimeError)
    end
  end

  describe "#get" do
    include_examples "errors"
  end

  describe "#post" do
    include_examples "errors"
  end
end
