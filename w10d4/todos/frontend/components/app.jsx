import React from 'react'
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import TodoListContainer from './todos/todo_list_container'


class App extends React.Component{

  render(){
    return(
      <div>
        <h1>React App</h1>
        <TodoListContainer />
      </div>

      
    )
  }
}

export default App;