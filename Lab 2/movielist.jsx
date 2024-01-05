import React from "react";
import classes from "./movielist.module.css";
class MovieList extends React.Component {
  render() {
    let first = "Barbie";
    let second = "Super Mario";
    let third = "Black";
    return (
      <div>
        <h1>Movie List</h1>
        <h4>{first}</h4>
        <h4>{second}</h4>
        <h4>{third}</h4>
      </div>
    );
  }
}

export default MovieList;
