import React from "react";
import classes from "./booklist.module.css";

class BookList extends React.Component {
  render() {
    let first = "It's Okay";
    let second = "White Silence";
    let third = "Avatar";
    return (
      <div>
        <h1>Book List</h1>
        <h4>{first}</h4>
        <h4>{second}</h4>
        <h4>{third}</h4>
      </div>
    );
  }
}

export default BookList;
