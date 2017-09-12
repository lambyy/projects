import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleRemove = this.handleRemove.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
    this.updateButton = this.updateButton.bind(this);
  }

  handleRemove(event) {
    event.preventDefault();

    this.props.removeTodo(this.props.todo.id);
  }

  updateTodo(event) {
    event.preventDefault();

    const todo = Object.assign({}, this.props.todo);
    todo.done = !todo.done;
    // this.props.createTodo(todo);
  }

  updateButton() {
    if (this.props.todo.done) {
      return "Undo";
    }
    return "Done";
  }

  render() {
    const { todo } = this.props;

    return (
      <div>
        <li>
          {todo.title + '   '}
          <button onClick={this.updateTodo}>{this.updateButton()}</button>
          <button onClick={this.handleRemove}>Remove</button>
        </li>

      </div>

    );
  }
}

export default TodoListItem;
