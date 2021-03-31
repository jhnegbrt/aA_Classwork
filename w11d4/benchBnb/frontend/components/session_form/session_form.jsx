import React from 'react'
import { Link } from 'react-router-dom'

class SessionForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      username: "",
      password: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
    this.setState({
      username: "",
      password: ""
    })
  }

  handleChange(e){
    this.setState({
      [e.target.name]: e.target.value
    })
  }

  render(){

    let otherForm = ""
    if (this.props.formType === "signin"){
      otherForm = "signup"
    } else {
      otherForm = "signin"
    }
    return(

      <div>
        <h3>Welcome to Bench BNB!</h3>
        <h4>Please {this.props.formType} or <Link to={`/${otherForm}`}>{otherForm}</Link></h4>
        <form onSubmit={this.handleSubmit}>
          <label>Username
            <input type="text" value={this.state.username} name ="username" onChange={this.handleChange}></input>
          </label>

          <label>Password
            <input type="password" value={this.state.password} name="password" onChange={this.handleChange}></input>
          </label>
          
          <input type="submit" value={this.props.formType}></input>

        </form>
      </div>


    )
  }
}

export default SessionForm