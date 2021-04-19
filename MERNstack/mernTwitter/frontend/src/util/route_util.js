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

const Protected = ({ component: Component, loggedIn, ...rest}) => (
  <Route
    {...rest}
    render={props =>
      loggedIn ? (
        <Component {...props} />
      ) : (
        // Redirect to the login page if the user is already authenticated
        <Redirect to="/tweets" />
      )
    }
  />
);


const mapStateToProps = state => (
  {loggedIn: state.session.isAuthenticated}
);

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));

export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));