import React from 'react'



class TodoListItem extends React.Component{

  constructor(props){
    super(props)

    this.handleRemove = this.handleRemove.bind(this)
    this.handleDone = this.handleDone.bind(this)
    this.state = {
      done: this.props.todo.done,
    }
  }

  handleRemove(e){

    // e.preventDefault()
    this.props.removeTodo(this.props.todo.id)
    
  }

  handleDone(e){

    //e.preventDefault()
    this.setState({
      done: !this.state.done
    })
    this.props.receiveTodo(this.state)

  }
  
  render(){

    return(
      <li>
        {this.props.todo.title} 
        <button onClick={this.handleRemove}>Remove</button>
        <button onClick={this.handleDone}>{this.state.done ? 'Undo' : 'Done'}</button>
      </li>
    )
  }


}

export default TodoListItem