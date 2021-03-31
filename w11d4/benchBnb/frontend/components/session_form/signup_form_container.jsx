import { connect } from 'react-redux'
import SessionForm from './session_form'
import React from 'react'
import {signup} from '../../actions/session_actions'

const mSTP = state => ({
  errors: state.errors,
  formType: "signup"
})

const mDTP = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(signup(user))
})

export default connect(
  mSTP,
  mDTP
)(SessionForm);