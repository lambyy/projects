import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const { todos, errors, createTodo, removeTodo, clearErrors } = this.props;

    return (
      <div>
        <ul>
          {
            todos.map( todo => (
              <TodoListItem key={todo.id}
                            todo={todo}
                            createTodo={createTodo}
                            removeTodo={removeTodo}/>
            ))
          }
        </ul>
        <TodoForm errors={errors}
                  createTodo={createTodo}
                  clearErrors={clearErrors}/>
      </div>
    );
  }
}

export default TodoList;
