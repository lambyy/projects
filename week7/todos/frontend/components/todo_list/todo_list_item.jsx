import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleRemove = this.handleRemove.bind(this);
  }

  handleRemove(event) {
    event.preventDefault();

    this.props.removeTodo(this.props.todo);
  }

  render() {
    const { todo } = this.props;
    return (
      <div>
        <li>{todo.title}</li>
        <button onClick={this.handleRemove}>Remove</button>
      </div>

    );
  }
}

export default TodoListItem;
