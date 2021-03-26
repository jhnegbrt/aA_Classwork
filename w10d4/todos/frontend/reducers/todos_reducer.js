import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions"
// import {  } from "../actions/todo_actions"
// import {receiveTodos, receiveTodo, removeTodo} from "../actions/todo_actions"


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
  3: {
    id: 3,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


const todosReducer = (state = initialState, action) =>{
  Object.freeze(state)
  let nextState = Object.assign({}, state)
  switch (action.type){

    case RECEIVE_TODOS:
      nextState = {};
      action.todos.forEach(object =>{
        nextState[object.id] = object;
      });
      return nextState;
      
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    
    case REMOVE_TODO:
      delete nextState[action.id];
      return nextState;
    default:
      return state;
    
      
  }
}


export default todosReducer;