import React from 'react'
import ReactDOM from 'react-dom'
import Minesweeper from './components/react_minesweeper'

document.addEventListener('DOMContentLoaded', ()=>{
  const root = document.getElementById('root');
  ReactDOM.render(<Minesweeper />, root);
});
