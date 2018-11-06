import React from 'react';

class ToDoForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false,
    };
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.submit = this.submit.bind(this);
  }

  submit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state);
    this.props.createTodo(todo).then(() => {
      this.setState({title: "", body: "", done: false});
    });
  }

  updateTitle(event) {
    this.setState({title: event.currentTarget.value});
  }

  updateBody(event) {
    this.setState({body: event.currentTarget.value});
  }

  render () {
    return (
      <form onSubmit={this.submit}>
        <label>Title</label>
        <input onChange={this.updateTitle} value={this.state.title} />
        <label>Body</label>
        <input onChange={this.updateBody} value={this.state.body} />
        <input type="submit" value="Submit"/>
      </form>
    );
  }

}

export default ToDoForm;
