import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleRemove = this.handleRemove.bind(this);
    this.toggleTodo = this.toggleTodo.bind(this);
    this.updateButton = this.updateButton.bind(this);
  }

  handleRemove(event) {
    event.preventDefault();

    this.props.removeTodo(this.props.todo.id);
  }

  toggleTodo(event) {
    event.preventDefault();

    const todo = merge({}, this.props.todo, {
      done: !this.props.todo.done
    });
    this.props.updateTodo(todo);
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
          <button onClick={this.toggleTodo}>{this.updateButton()}</button>
          <button onClick={this.handleRemove}>Remove</button>
        </li>
      </div>

    );
  }
}

export default TodoListItem;
