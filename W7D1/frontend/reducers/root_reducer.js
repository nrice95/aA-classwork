import { combineReducers } from 'redux';
import todos from './todos_reducer.js';


export default combineReducers({
  todos: todos
});
