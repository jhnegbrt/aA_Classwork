import React from 'react';
import { render } from 'react-dom';
import Clock from './clock';
import Tabs from './tabs'



const Root = () => {

  const panes = [
    {title: "One", content: "I am the first piece of content"}, 
    {title: "Two", content: "I am the second"}, 
    {title: "Three", content: "I am the third"}
  ]

  return(
    <div>
      <Clock />
      <Tabs panes={panes}/>
    </div>
  )
}

export default Root;
