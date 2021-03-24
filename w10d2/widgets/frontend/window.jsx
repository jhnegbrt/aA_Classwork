import React from 'react'

class Window extends React.Component{

  constructor(props){
    super(props)
  }

  render(){
    return(
      <h3 className="window">{this.props.content}</h3>
    )
  }

}

export default Window;