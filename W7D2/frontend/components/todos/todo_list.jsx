import React from "react";
import ToDoListItem from "./todo_list_item";
import ToDoForm from './todo_form';

// const ToDoList = (props) => {
//   // debugger
//   return (
//     <ul>
//       <ToDoForm receiveTodo={props.receiveTodo} />
//       {props.todos.map (todo => (
//         // debugger
//         // <li key={todo.id}>
//         //   {todo.title}: {todo.body}
//         // </li>
//         <ToDoListItem key={todo.id} item={todo}/>
//       ))}
//     </ul>
//   );
// };

class ToDoList extends React.Component {
  constructor(props){
    super(props);
  }

  render() {
    return (
      <ul>
        <ToDoForm
          receiveTodo={this.props.receiveTodo}
          createTodo={this.props.createTodo}/>
        {this.props.todos.map (todo => (
          // debugger
          // <li key={todo.id}>
          //   {todo.title}: {todo.body}
          // </li>
          <ToDoListItem key={todo.id} item={todo}/>
        ))}
      </ul>
    );
  }

  componentDidMount(){
    this.props.fetchTodos();
  }
}

// <h3>Todo List goes here!</h3>;

export default ToDoList;
