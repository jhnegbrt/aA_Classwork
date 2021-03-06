import { connect } from 'react-redux'
import SessionForm from './session_form'
import React from 'react'
import {login} from '../../actions/session_actions'

const mSTP = state => ({
  errors: state.errors.session,
  formType: "signin"
})

const mDTP = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(login(user))
})

export default connect(
  mSTP,
  mDTP
)(SessionForm);