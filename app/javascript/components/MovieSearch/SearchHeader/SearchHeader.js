import React, { Component } from 'react';

const SearchHeader = (props) => {
    let { searchTerm, searchTermUpdated, searchClick } = props;

    const canSearch = () => {
      return(searchTerm.length > 3)
    }

    return(
      <header className="search-header">
        <div className="container">
          <div className="row">
            <div className="col-10">
              <input className="form-control control search-input" value={searchTerm} onChange={searchTermUpdated} placeholder="Search movie..."/>
            </div>
            <div className="col-2">
              <button className="form-control control search-button" disabled={!canSearch()} onClick={searchClick}>Search</button>
            </div>
          </div>
        </div>
      </header>
    );
}

export default SearchHeader;