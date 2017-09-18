import { postUser, postSession, deleteSession } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const createNewUser = formUser => dispatch => {
  return postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)))
    .fail(errors => dispatch(receiveErrors(errors)));
};

export const login = formUser => dispatch => {
  return postSession(formUser)
  .then(user => dispatch(receiveCurrentUser(user)))
  .fail(errors => dispatch(receiveErrors(errors)));
};

export const logout = () => dispatch => {
  return deleteSession()
  .then(user => dispatch(receiveCurrentUser(null)))
  .fail(errors => dispatch(receiveErrors(errors)));
};
