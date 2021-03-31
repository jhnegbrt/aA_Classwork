import React from 'react'


class Greeting extends React.Component{
  constructor(props){
    super(props)
  }

  render(){

    
    const genericGreeting = <p>this is our generic</p>
    const personalGreeting = <p>this is our personal</p>
    const greeting = (this.props.currentUser ? personalGreeting : genericGreeting) 
    return(
      <div> {greeting} </div>
    )
  }
}

export default Greeting