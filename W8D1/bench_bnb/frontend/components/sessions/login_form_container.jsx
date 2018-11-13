import React from "react";
import { connect } from "react-redux";

import { login } from "../../actions/session_action";

// const msp = (state, ownProps) => {
//
// }

const mdp = dispatch => {
  return {
    processForm: (user) => dispatch(login(user))
  };
};
