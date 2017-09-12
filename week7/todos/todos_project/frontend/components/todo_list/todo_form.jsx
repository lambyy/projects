import React from 'react';
import { uniqueId } from '../../util/todo_api_util';

class TodoForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = { title: "", body: "" };

    this.handleInputTitle = this.handleInputTitle.bind(this);
    this.handleInputBody = this.handleInputBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.displayErrors = this.displayErrors.bind(this);
  }

  handleInputTitle(event) {
    event.preventDefault();

    this.setState({ title: event.currentTarget.value });
  }

  handleInputBody(event) {
    event.preventDefault();

    this.setState({ body: event.currentTarget.value });
  }

  handleSubmit(event) {
    event.preventDefault();

    const { title, body } = this.state;
    const { createTodo, clearErrors } = this.props;
    // const todo = Object.assign({}, this.state, { id: uniqueId(), done: false });
    const todo = {
      // id: uniqueId(),
      title,
      body,
      done: false
    };

    createTodo(todo).then(
      () => {
        this.setState({ title: "", body: ""});
        clearErrors();
      }
    );
  }

  displayErrors() {
    const { errors } = this.props;
    if (errors.length > 0) {
      return (
        <ul>
          {
            errors.map( (error, idx) => <li key={idx}>{error}</li> )
          }
        </ul>
      );
    }
  }

  render() {
    const { title, body } = this.state;

    return (
      <div>
        <label>
          Title:
          <br />
          <input id="todo-title" type="text"
            value={title}
            onChange={this.handleInputTitle}></input>
        </label>
        <br />

        <label>
          Body:
          <br />
          <textarea id="todo-body"
            value={body}
            onChange={this.handleInputBody}></textarea>
        </label>
        <br />

        <input type="submit"
               value="Create todo!"
               onClick={this.handleSubmit}>
        </input>

        {this.displayErrors()}
      </div>
    );
  }
}

export default TodoForm;
