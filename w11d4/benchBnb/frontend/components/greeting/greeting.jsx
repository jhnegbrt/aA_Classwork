import React from 'react'
import { Link } from 'react-router-dom'


class Greeting extends React.Component{
  constructor(props){
    super(props)
  }

  render(){

    const username = (this.props.currentUser ? this.props.currentUser.username : "") 
    const genericGreeting = () => (
      <div>
        <h2>Welcome to BenchBNB</h2>
        <Link to='/login'>Login</Link>
        &nbsp;or&nbsp;
        <Link to='/signup'>Sign Up!</Link>
      </div>
    );

    const personalGreeting = () => (
      <div>
        <h2>Hello, {username}</h2>
        <button onClick={this.props.logout}>Logout</button>
      </div>
    );
    
    const greeting = (this.props.currentUser ? personalGreeting() : genericGreeting())

    return(
      <div> {greeting} </div>
    )
  }
}

export default Greeting;