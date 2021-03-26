import React from 'react'



class TodoDetailView extends React.Component{
    constructor(props){
        super(props)
    }

  handleRemove(e){

    // e.preventDefault()
    this.props.removeTodo(this.props.todo.id)
    
  }

  render(){
      return(
        <div>
            <h3>{this.props.todo.body}</h3>
            <button onClick={this.handleRemove}>Remove</button>
        </div>
      )
  }





}

export default TodoDetailView;