export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
import * as ApiUtil from '../util/todo_api_util';
import receiveErrors from "./error_actions";

export const receiveTodos = (todos) => {
    return {
      type: RECEIVE_TODOS,
      todos: todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo,
    id: todo.id
    // title: todo.title,
    // body: todo.body,
    // done: todo.done
  };
};

export const fetchTodos = () => dispatch => {
  return ApiUtil.fetchTodos().then(todos => {
    return dispatch(receiveTodos(todos));
  });
};

export const fetchTodo = (todo) => dispatch => {
  return ApiUtil.fetchTodo(todo).then(todo => {
    return dispatch(receiveTodo(todo));
  });
};

export const createTodo = (todo) => dispatch => {
  return ApiUtil.createTodo(todo).then(
    todo => dispatch(receiveTodo(todo)),
    err => dispatch(receiveErrors(err.responseJSON))
  );
};
