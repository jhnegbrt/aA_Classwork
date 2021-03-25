import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'

const store = configureStore()
window.store = store

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById('root');
  ReactDOM.render(<div>React is working</div>, root);
})

