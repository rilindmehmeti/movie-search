describe Api::V1::MoviesController, type: :request do
  describe "#search" do
    context "when search doesn't throw errors" do
      let(:stubbed_search_result) do
        [
          Movie.new(title: "Title1", year: "2010", poster_url: "url_1"),
          Movie.new(title: "Title1", year: "2010", poster_url: "url_1")
        ]
      end

      before do
        allow(Mw::Movie::Search).to receive(:call).and_return(stubbed_search_result)
        post "/api/v1/movies/search", params: { search_term: "mySearch" }
      end

      it "returns movies" do
        response_body = JSON.parse(response.body)
        expect(response_body).to eq({ movies: stubbed_search_result.map(&:as_json) }.as_json)
      end

      it "returns ok status" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when search throws controlled error" do
      before do
        expect(Mw::Movie::Search).to receive(:call).and_raise(Searcher::Errors::ApiError.new("MyApi Error"))
        post "/api/v1/movies/search", params: { search_term: "mySearch" }
      end

      it "returns unprocessed_entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns error message of the error" do
        response_body = JSON.parse(response.body)
        expect(response_body).to eq({ error: "MyApi Error" }.as_json)
      end
    end

    context "when search throws uncontrolled error" do
      before do
        expect(Mw::Movie::Search).to receive(:call).and_raise(StandardError.new("Uncontrolled Error"))
      end

      it "raises error" do
        expect do
          post "/api/v1/movies/search", params: { search_term: "mySearch" }
        end.to raise_error(StandardError)
      end
    end
  end
end
