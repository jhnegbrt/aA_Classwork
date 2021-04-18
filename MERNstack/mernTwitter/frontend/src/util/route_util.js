import React, { Component } from 'react'
import { connect } from 'react-redux'
import {Route, Redirect, withRouter } from 'react-redux-dom'

const Auth = ({ component: Component, path, loggedIn, exact}) => (
  <Route path={path} exact={exact} render={(props) => (
    !loggedIn ? (
      <Component {...props} />
    ) : (
      <Redirect to="/tweets" />
    )
  )} />
)

const Protected = ({ component: Component})