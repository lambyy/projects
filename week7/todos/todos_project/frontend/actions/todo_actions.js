import * as APIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (id) => {
  return {
    type: REMOVE_TODO,
    id
  };
};

export const fetchTodos = () => {
  return (dispatch) => {
    return APIUtil.fetchTodos().then( todos => dispatch(receiveTodos(todos)));
  };
};

window.APIUtil = APIUtil;
window.fetchTodos = fetchTodos;
