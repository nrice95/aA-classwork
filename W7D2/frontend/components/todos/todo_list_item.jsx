import React from "react";

const ToDoListItem = (props) => {
  // debugger
  return(
    <li>{props.item.title}: {props.item.body}</li>
  );
};

export default ToDoListItem;
