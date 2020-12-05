describe Presenters::Mapping do
  describe "::MAPPING" do
    let(:presenters_mapping) do
      {
        Movie: {
          default: "Presenters::Movie::Default"
        }
      }
    end

    it "matches presenters mapping" do
      expect(described_class::MAPPING).to eq(presenters_mapping)
    end
  end
end
