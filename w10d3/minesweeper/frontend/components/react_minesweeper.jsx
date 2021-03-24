import React from 'react'
import Game from './game'

class Minesweeper extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    return(
    <div>
      <Game />
    </div>
    ) 
  }
  
}



export default Minesweeper