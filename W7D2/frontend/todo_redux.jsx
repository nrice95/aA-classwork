
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';
import Root from "./components/root";
import Store from './store/store';
import { receiveTodos, receiveTodo, fetchTodos } from "./actions/todo_actions";
import allTodos from './reducers/selectors.js';

document.addEventListener("DOMContentLoaded", function(){
  const rootElement = document.getElementById("content");
  // ReactDOM.render(<h1>Todos App</h1>, document.getElementById('root'));
  ReactDOM.render(<Root store={Store}/>, rootElement);
});

window.store = Store;
window.fetchTodos = fetchTodos;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.allTodos = allTodos;
