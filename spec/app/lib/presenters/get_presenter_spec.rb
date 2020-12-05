describe Presenters::GetPresenter do
  let(:presenter_key) { nil }
  let(:object)        { Movie.new(title: "myTitle", year: "2010", poster_url: "myUrl") }

  subject { described_class.new(object, presenter_key: presenter_key) }

  describe ".initialize" do
    context "with supported params" do
      context "with only object" do
        it_behaves_like "without initialization errors"

        context "with presenter_key as well" do
          subject { described_class.new(object, presenter_key: :default) }
          it_behaves_like "without initialization errors"
        end
      end
    end

    context "with unsupported params" do
      subject { described_class.new(object, other_key: :default) }
      it_behaves_like "with initialization errors"
    end

    context "without params" do
      subject { described_class.new }
      it_behaves_like "with initialization errors"
    end
  end

  describe "#object_class_name" do
    it "returns the name of object class" do
      expect(subject.object_class_name).to eq("Movie")
    end
  end

  shared_examples "call method examples" do
    context "when object class is not configured in MAPPING" do
      let(:object) { 3 }
      it "gives base presenter" do
        expect(subject).to eq(Presenters::Base)
      end
    end

    context "when presenter is missing" do
      it "gives default presenter for the given object class" do
        expect(subject).to eq(Presenters::Mapping::MAPPING.with_indifferent_access[object.class.name][:default].constantize)
      end
    end

    context "when presenter key is not configured" do
      let(:presenter_key) { :some_other_key }
      it "throws NoMethodError" do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end

  describe "#call" do
    subject { described_class.new(object, presenter_key: presenter_key).call }
    include_examples "call method examples"
  end

  describe ".call" do
    subject { described_class.call(object, presenter_key: presenter_key) }
    include_examples "call method examples"
  end
end
