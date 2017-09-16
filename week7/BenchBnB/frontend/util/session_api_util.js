// SIGN UP
export const postUser = (user) => {
    return $.ajax({
      method: 'POST',
      url: '/api/users',
      data: { user }
    });
};

// SIGN IN
export const postSession = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/api/session',
    data: { user }
  });
};

//SIGN OUT
export const deleteSession = () => {
  return $.ajax({
    method: 'DELETE',
    url: '/api/session',
  });
};
