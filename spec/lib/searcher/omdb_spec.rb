describe Searcher::Omdb do
  let(:object) { described_class.new }
  subject { object }

  describe "token" do
    it "returns configured token" do
      expect(object.token).to eq("a0b24f57")
    end
  end
end
