import React from 'react'
import ReactDOM from 'react-dom'
import MovieSearch from "../components/MovieSearch/MovieSearch";

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <MovieSearch />,
    document.body.appendChild(document.createElement('div')),
  )
})