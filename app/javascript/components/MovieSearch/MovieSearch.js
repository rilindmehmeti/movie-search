import React, { Component } from 'react';
import SearchHeader from "./SearchHeader/SearchHeader";
import SearchResults from "./SearchResults/SearchResults";

const movies = new Array(100).fill({
  title: "Game of Thrones",
  year: "2010",
  poster_url: "https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_.jpg"
})

class MovieSearch extends Component {
  state = {
    searchTerm: "",
    movies: movies
  }

  searchTermUpdateHandler = (searchTerm) => {
    this.setState({searchTerm: searchTerm.target.value})
  }

  searchClickHandler = () => {
    alert("You Searched!");
  }

  render() {
    return(
      <>
        <SearchHeader searchTerm={this.state.searchTerm} searchTermUpdated={this.searchTermUpdateHandler} searchClick={this.searchClickHandler}/>
        <SearchResults movies={this.state.movies} />
      </>
    )
  }
}

export default MovieSearch;