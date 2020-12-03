describe Movie do
  let(:title)      { "MyTitle" }
  let(:year)       { 2020 }
  let(:poster_url) { "https://m.media-amazon.com/images/M/MV5BODg0YTM4NzEtZDQyNi00M2MzLWE3MDQtNjcxNTkxNWM0NzNhXkEyXkFqcGdeQXVyMjM5NzU3OTM@._V1_SX300.jpg" }
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

      it "throws ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
