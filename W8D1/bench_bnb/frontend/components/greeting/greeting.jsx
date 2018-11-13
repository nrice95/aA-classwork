import React from "react";
import { Link } from "react-router-dom";
//
class Greeting extends React.Component {
//
  render() {
    const { currentUser } = this.props;
    if (!currentUser) {
      return(
      <div>
        <Link to="/api/users">Sign Up</Link>
        <br></br>
        <Link to="/api/session">Login</Link>
      </div>);
    } else{
      return(
      <div>
        <h3>{`Welcome ${currentUser.username}`}</h3>
      </div>);
    }
  }
}
//
export default Greeting;
