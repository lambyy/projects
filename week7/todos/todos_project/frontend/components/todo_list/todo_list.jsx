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
    let { todos, errors } = this.props;
    const { createTodo, updateTodo, removeTodo, clearErrors } = this.props;
    // todos = todos.sort(function(a, b) {
    //   if (a.id < b.id) {
    //     return -1;
    //   }
    //   return 1;
    // });

    return (
      <div>
        <ul>
          {
            todos.map( (todo, idx) => (
              <TodoListItem key={idx}
                            todo={todo}
                            updateTodo={updateTodo}
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
