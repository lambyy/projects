import React from 'react';
import { uniqueId } from '../../util/util';

class TodoForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = { title: "", body: "" };

    this.handleInputTitle = this.handleInputTitle.bind(this);
    this.handleInputBody = this.handleInputBody.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleInputTitle(event) {
    event.preventDefault();

    this.setState({ title: event.currentTarget.value });
  }

  handleInputBody(event) {
    event.preventDefault();

    this.setState({ body: event.currentTarget.value });
  }

  handleClick(event) {
    event.preventDefault();

    const { title, body } = this.state;
    const { receiveTodo } = this.props;
    // const todo = Object.assign({}, this.state, { id: uniqueId(), done: false });
    const todo = {
      id: uniqueId(),
      title,
      body,
      done: false
    };

    receiveTodo(todo);
    this.setState({ title: "", body: ""});
  }

  render() {
    const { title, body } = this.state;

    return (
      <div>
        <label id="todo-title">Title:</label>
        <br />
        <input id="todo-title" type="text"
               value={title}
               onChange={this.handleInputTitle}></input>
        <br />

        <label id="todo-body">Body:</label>
        <br />
        <textarea id="todo-body"
                  value={body}
                  onChange={this.handleInputBody}></textarea>
        <br />

        <input type="submit"
               value="Create todo!"
               onClick={this.handleClick}></input>
      </div>
    );
  }
}

export default TodoForm;
