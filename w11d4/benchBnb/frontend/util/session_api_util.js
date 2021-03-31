export const signUp = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/users',
    data: { user: user }
  })
)

export const logIn = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/session',
    data: { user: user }
  })
)

export const logOut = (user) =>(
  $.ajax({
    method: 'DELETE',
    url: `/api/session/${user.id}`
  })
)