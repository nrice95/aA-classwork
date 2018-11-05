import React from "react";
import ToDoListItem from "./todo_list_item";

const ToDoList = (todos = []) => {
  // debugger
  return (
    <ul>
      {todos.todos.map (todo => (
        // debugger
        // <li key={todo.id}>
        //   {todo.title}: {todo.body}
        // </li>
        <ToDoListItem key={todo.id} item={todo}/>
      ))}
    </ul>
  );
};

// <h3>Todo List goes here!</h3>;

export default ToDoList;
