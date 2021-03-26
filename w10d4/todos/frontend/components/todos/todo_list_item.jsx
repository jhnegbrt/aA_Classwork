import React from 'react'



class TodoListItem extends React.Component{

  constructor(props){
    super(props)

    this.handleRemove = this.handleRemove.bind(this)
    this.handleDone = this.handleDone.bind(this)
    this.state = {
      done: this.props.todo.done,
      detail: false
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

  handleDetail(e){
    this.setState({
      detail: !this.state.detail
    })
    // this.props.receiveTodo(this.state)
  }
  
  render(){

    return(
      <li>
        <span onClick={this.handleDetail}>{this.props.todo.title}</span>
        {/* <button onClick={this.handleRemove}>Remove</button> */}
        <button onClick={this.handleDone}>{this.state.done ? 'Undo' : 'Done'}</button>
        {this.state.detail? <TodoDetailViewContainer todo={this.props.todo} /> : ""}
      </li>
    )
  }


}

export default TodoListItem