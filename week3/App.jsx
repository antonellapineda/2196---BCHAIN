import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import Hello from "./components/Hello";
import Welcome from "./components/welcome";
import ToDoList from "./components/TodoList";
import BookList from "./components/booklist";
import MovieList from "./components/movielist";
import Greeting from "./components/week3/demo1/Greeting";
import ShinyButton from "./components/week3/demo1/ShinyButton";
import Rainy from "./components/week3/demo2/Rainy";
import Rainyy from "./components/week3/demo3/Rainy";
import RainOrShine from "./components/week3/demo4/RainorShine";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
    <h1>Demo 1</h1>
    <Greeting />
    <ShinyButton />

    <h1>Demo 2</h1>
    <Rainy />

    <h1>Demo 3</h1>
    <Rainyy />

    <h1>Demo 4</h1>
    <RainOrShine />
    </>
  );
}

export default App;
