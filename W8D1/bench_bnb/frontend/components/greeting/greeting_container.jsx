import { connect } from "react-redux";
import Greeting from "./greeting";
import { receiveCurrentUser } from "../../actions/session_actions";
//
const msp = state => {
  // debugger
  const currentUser = state.entities.users[state.session.currentUserId];
  return({ currentUser: currentUser });
};
//
const mdp = dispatch => ({
  receiveCurrentUser: currentUser => dispatch(receiveCurrentUser(currentUser))
});
//
export default connect(msp,mdp)(Greeting);
