import React from 'react'
import { connect } from 'react-redux'
import { Redirect, Route, withRouter } from 'react-router-dom'

const mapStateToProps = state => ({
  loggedIn: Boolean(state.session.currentUser)
})

const Auth = state => {
  
  
  const Component = state.component.Component
  const path = state.path
  const loggedIn = state.loggedIn
  return(
    <
  )
}