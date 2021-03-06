import React from "react";
import ReactDOM from "react-dom";
import {signup, login, logout} from './actions/session_actions'
import configureStore from "./store/store";
import Root from './components/root'

// import {signUp, login, logout} from '../frontend/util/session_api_util'

document.addEventListener("DOMContentLoaded", () => {



  const store = configureStore()
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  window.signup = signup
  window.login = login
  window.logout = logout

  const root = document.getElementById("root");
  ReactDOM.render(<Root store = {store} />, root);

});