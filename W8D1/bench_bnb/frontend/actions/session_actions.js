import * as APIUtil from "../util/session_api_util";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

export const receiveCurrentUser = (currentUser) => {
  // debugger
  return {
    type: RECEIVE_CURRENT_USER,
    user: currentUser
  };
};

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors,
});

export const login = (user) => dispatch => {
  // debugger
  return APIUtil.login(user).then(res => {
    // debugger
    return dispatch(receiveCurrentUser(res));
  });
};

export const logout = () => dispatch => {
  return APIUtil.logout().then(() => dispatch(logoutCurrentUser()));
};

export const signup = (user) => dispatch => {
  return APIUtil.signup(user).then(res => dispatch(receiveCurrentUser(res)));
};
