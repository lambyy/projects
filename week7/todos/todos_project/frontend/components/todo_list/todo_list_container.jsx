import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import * as TodoActions from '../../actions/todo_actions';
import { clearErrors } from '../../actions/error_actions';

const mapStateToProps = (state) => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(TodoActions.createTodo(todo)),
  removeTodo: (id) => dispatch(TodoActions.removeTodo(id)),
  fetchTodos: () => dispatch(TodoActions.fetchTodos()),
  clearErrors: () => dispatch(clearErrors())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
