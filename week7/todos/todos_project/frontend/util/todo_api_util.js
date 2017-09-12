export const uniqueId = function uniqueId() {
  return new Date().getTime();
};

export const fetchTodos = function fetchTodos() {
  return $.ajax({
    method: 'GET',
    url: '/api/todos'
  });
};
 export const createTodo = function createTodo(todo) {
   return $.ajax({
     method: 'POST',
     url: '/api/todos',
     data: JSON.stringify(todo),
     dataType: 'json',
     contentType: 'application/json'
   });
 };
