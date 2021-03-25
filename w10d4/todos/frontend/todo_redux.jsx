import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions"
import {receiveSteps, receiveStep, removeStep} from "./actions/step_actions"
import Root from './components/root'
import { allTodos } from './reducers/selectors'

const store = configureStore()
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.removeTodo = removeTodo;
window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;
window.allTodos = allTodos;




document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
})

