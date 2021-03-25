import React from 'react'
import * as Minesweeper from './minesweeper'
import Board from './board'

class Game extends React.Component{
  constructor(props){
    super(props)
    this.state = {
      board: new Minesweeper.Board(10, 4)
    }

    this.updateGame = this.updateGame.bind(this)
  }

  updateGame(){

    debugger

    let sring = "string"
    return sring

  }


  render(){
    
    return(
      <Board board={this.state.board} updateGame={this.updateGame}/>
    )
  }
}

export default Game;