import { combineReducers } from 'redux';
import todos from './todos_reducer.js';
import errors from "./errors_reducer";


export default combineReducers({
  todos: todos,
  errors: errors,
});
