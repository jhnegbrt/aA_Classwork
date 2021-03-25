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

  updateGame(tile, alt){

    // debugger

    if(alt){
      tile.toggleFlag()
    } else {
      tile.explore()
    }
    this.setState({ board: this.state.board })

  }


  render(){
    
    return(
      <Board board={this.state.board} updateGame={this.updateGame}/>
    )
  }
}

export default Game;