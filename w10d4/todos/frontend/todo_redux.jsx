import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {receiveTodos, receiveTodo} from "./actions/todo_actions"

const store = configureStore()
window.store = store;
window.receiveTodo = receiveTodo;



document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById('root');
  ReactDOM.render(<div>React is working</div>, root);
})

