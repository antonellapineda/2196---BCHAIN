import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import Hello from "./components/Hello";
import Welcome from "./components/welcome";
import ToDoList from "./components/TodoList";
import BookList from "./components/booklist";
import MovieList from "./components/movielist";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Hello />
      <Welcome />
      <ToDoList />
      <BookList />
      <MovieList />
    </>
  );
}

export default App;
