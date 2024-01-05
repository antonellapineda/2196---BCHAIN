import React from "react";

class Welcome extends React.Component {
  render() {
    let message = "Welcome, Antonella!";
    return (
      <div>
        <h1>I think I've done it</h1>
        <h4>{message}</h4>
      </div>
    );
  }
}

export default Welcome;
