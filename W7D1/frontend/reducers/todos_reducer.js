import { RECEIVE_TODOS } from '../actions/todo_actions';
import { RECEIVE_TODO } from '../actions/todo_actions';
import { merge } from 'lodash';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      // return Object.assign({}, state, action.todos);
      let final = {};
      action.todos.forEach (todo => final[todo.id] = todo);
      return final;
    case RECEIVE_TODO:
      // debugger
      // const newTodo = {
        // [id]: {
        //   title: action.title,
        //   body: action.body,
        //   done: action.done,
        //   id: id
        // }
      // };

      // const newState = merge({}, state, newItem);
      const newState = merge({}, state, {[action.id]: action.todo});
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
