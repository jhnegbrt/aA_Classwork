import React from 'react'

class SessionForm extends React.Component {

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
  }

  constructor(props) {
    super(props)
    this.state = {
      username: "",
      password: ""
    }
  }
}

export default SessionForm