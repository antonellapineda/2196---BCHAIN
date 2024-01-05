import React from "react";
import classes from "./todolist.module.css";
class ToDoList extends React.Component {
  render() {
    let first = "Go to School";
    let second = "Go to Vet";
    let third = "Buy Food";
    return (
      <div>
        <h1>To Do List</h1>
        <h4>{first}</h4>
        <h4>{second}</h4>
        <h4>{third}</h4>
      </div>
    );
  }
}

export default ToDoList;
