import React from 'react';
// import ReactDOM from 'react-dom';
import * as APIUtil from './util/session_api_util'; //TEST
// import configureStore from "./store/store";
import { login, signup, logout } from "./actions/session_actions";

import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // TESTING START
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // TESTING END
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store }/>, root);
  // ReactDOM.render(<h1>hi</h1>, root);
});

window.login = login;
window.logout = logout;
window.signup = signup;
window.store = configureStore();
