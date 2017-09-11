import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import {receiveTodos, receiveTodo} from './actions/todo_actions';

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;

const store = configureStore();
window.store = store;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<h1>This be my App</h1>, document.getElementById('content'));
});
