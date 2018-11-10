import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtil from './util/session_api_util'; //TEST

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  window.login = APIUtil.login; //TEST
  window.signup = APIUtil.signup; //TEST
  window.logout = APIUtil.logout; //TEST
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
