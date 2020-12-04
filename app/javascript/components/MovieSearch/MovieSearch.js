import React, { Component } from 'react';
import axios from 'axios';

import SearchHeader from "./SearchHeader/SearchHeader";
import SearchResults from "./SearchResults/SearchResults";
import InformationMessage from "./InformationMessage/InformationMessage";

const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
const headers = { "Content-Type": "application/json", "X-CSRF-Token": csrf }
const HANDLED_ERROR_STATUS = 422;

class MovieSearch extends Component {
  state = {
    searchTerm: "",
    displayError: false,
    errorMessage: "",
    movies: []
  }

  searchTermUpdateHandler = (searchTerm) => {
    this.setState({searchTerm: searchTerm.target.value})
  }

  searchClickHandler = () => {
    axios.post("/api/v1/movies/search", {search_term: this.state.searchTerm}, { headers })
      .then(response => {
        this.setState({ movies: response.data.movies, displayError: false})
      })
      .catch(error => {
        // Handle 422 errors
        if(error.response.status == HANDLED_ERROR_STATUS) {
          this.setState({errorMessage: error.response.data.error, displayError: true });
        }
      });
  }

  render() {
    return(
      <>
        <SearchHeader searchTerm={this.state.searchTerm} searchTermUpdated={this.searchTermUpdateHandler} searchClick={this.searchClickHandler}/>
        { !this.state.displayError ? <SearchResults movies={this.state.movies} /> : <InformationMessage message={this.state.errorMessage} />}
      </>
    )
  }
}

export default MovieSearch;