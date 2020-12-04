import React from 'react';
import MovieCard from "./MovieCard/MovieCard";

const SearchResults = (props) => {
    let { movies } = props;
    const movieCards = movies.map((movie, index) => <MovieCard key={index} {...movie} />)
    return(
      <div className="container movies-container">
        <div className="row">
          {movieCards}
        </div>
      </div>
    );
}

export default SearchResults;