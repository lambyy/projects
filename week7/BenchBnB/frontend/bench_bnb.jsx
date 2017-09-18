import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { postUser, postSession, deleteSession } from './util/session_api_util';


window.postUser = postUser;
window.postSession = postSession;
window.deleteSession = deleteSession;
const store = configureStore();
console.log(store);
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
