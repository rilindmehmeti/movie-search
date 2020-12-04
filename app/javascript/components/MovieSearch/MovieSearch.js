import React, { Component } from 'react';
import SearchHeader from "./SearchHeader/SearchHeader";
import SearchResults from "./SearchResults/SearchResults";

class MovieSearch extends Component {
  state = {
    searchTerm: "",
    movies: []
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
        <SearchResults />
      </>
    )
  }
}

export default MovieSearch;