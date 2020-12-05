describe Presenters::Base do
  class TestClass
    attr_accessor :title, :description

    def initialize
      @title = "MyTitle"
      @description = "MyDescription"
    end
  end

  let(:object) { TestClass.new }

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
      expect(subject).to eq(object.as_json)
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
