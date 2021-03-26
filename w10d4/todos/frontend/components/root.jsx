import React from 'react'
import { Provider } from 'react-redux'
import App from './app'
// import store from '../store/store'
// window.store = store;

const Root = ({ store }) => (

  <Provider store={store}>
    <App />
    <h1>Root is rendering</h1>
  </Provider>

);

export default Root;

