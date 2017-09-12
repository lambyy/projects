import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import * as TodoActions from '../../actions/todo_actions';

const mapStateToProps = (state) => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(TodoActions.receiveTodo(todo)),
  removeTodo: (id) => dispatch(TodoActions.removeTodo(id)),
  fetchTodos: () => dispatch(TodoActions.fetchTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
