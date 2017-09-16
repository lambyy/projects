import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';

const _nullErrors = {
  errors: []
};

export default (state = _nullErrors, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return _nullErrors;
    case RECEIVE_ERRORS:
      const newErrors = action.errors;
      return Object.assign({}, state, { newErrors });
    default:
      return state;
  }
};
