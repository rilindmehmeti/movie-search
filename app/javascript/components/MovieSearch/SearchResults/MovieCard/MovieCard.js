import React from 'react';

const MovieCard = (props) => {
  let { title, year, poster_url } = props;

  return(
    <div className="col-4">
        <div className="card movie-card">
          <div className="row justify-content-center h-100">
            <div className="col-4 d-flex">
              <img src={poster_url} alt="Image Poster" className="movie-poster" />
            </div>
            <div className="col-8">
              <div className="row">
                <h3 className="movie-title">{title}</h3>
                <h6 className="movie-year">Year: {year}</h6>
              </div>
            </div>
          </div>
        </div>
    </div>
  );
}

export default MovieCard;