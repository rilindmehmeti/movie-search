describe Movie do
  let(:title)      { "MyTitle" }
  let(:year)       { 2020 }
  let(:poster_url) { "PosterUrl" }
  let(:params)     { { title: title, year: year, poster_url: poster_url } }

  subject { described_class.new(params) }

  describe ".initialize" do
    context "with all attributes as params" do
      it "assigns attributes correctly" do
        expect(subject.title).to      eq(title)
        expect(subject.year).to       eq(year)
        expect(subject.poster_url).to eq(poster_url)
      end
    end

    context "with some attributes as params" do
      let(:params) { { title: title, year: year } }

      it "assigns only attributes that were passed" do
        expect(subject.title).to      eq(title)
        expect(subject.year).to       eq(year)
        expect(subject.poster_url).to be_nil
      end
    end

    context "when not expected params are passed" do
      let(:params) { { my_title: title, year: year } }

      it_behaves_like "with initialization errors"
    end
  end
end
