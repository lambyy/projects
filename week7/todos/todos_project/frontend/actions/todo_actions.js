import * as APIUtil from '../util/todo_api_util';
import { receiveErrors } from './error_actions';

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
    return APIUtil.fetchTodos().then(
      todos => dispatch(receiveTodos(todos)
    ));
  };
};

export function createTodo(todo) {
  return (dispatch) => {
     return APIUtil.createTodo(todo)
     .then(
       response => dispatch(receiveTodo(response)),
       err => dispatch(receiveErrors(err.responseJSON))
    );
  };
}

export function updateTodo(todo) {
  return (dispatch) => {
    return APIUtil.updateTodo(todo)
      .then(
        response => {
          console.log(response);
          dispatch(receiveTodo(response));
        },
        err => dispatch(receiveErrors(err.responseJSON))
      );
  };
}

window.APIUtil = APIUtil;
