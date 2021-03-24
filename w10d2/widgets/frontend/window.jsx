import React from 'react'

class Window extends React.Component{

  constructor(props){
    super(props)
  }

  render(){
    return(
      <h3>{this.props.content}</h3>
    )
  }

}

export default Window;