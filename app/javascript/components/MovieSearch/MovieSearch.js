import React, { Component } from 'react';
import SearchHeader from "./SearchHeader/SearchHeader";
import SearchResults from "./SearchResults/SearchResults";

class MovieSearch extends Component {
  render() {
    return(
      <>
        <SearchHeader />
        <SearchResults />
      </>
    )
  }
}

export default MovieSearch;