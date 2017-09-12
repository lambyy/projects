export const uniqueId = function uniqueId() {
  return new Date().getTime();
};

export const fetchTodos = function fetchTodos() {
  return $.ajax({
    method: 'GET',
    url: '/api/todos'
  });
};
