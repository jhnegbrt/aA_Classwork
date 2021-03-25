import React from 'react'
import * as Minesweeper from './minesweeper'
import Tile from './tile'


class Board extends React.Component {
    constructor(props) {
        super(props)
    }
      
    
    render() {
        const board = this.props.board.grid.map((row, idx) => {
            const tiles = row.map((tile, jdx) => {
              return (
                <Tile key={`${idx}-${jdx}`} tile={tile} updateGame={this.props.updateGame}/>
              )
            })
            return (
            <div className="row"key={idx}>
                 {tiles}
            </div>
            )
        })
        return (
           <div>
            <h1>This is the board</h1>
            {board}
           </div>
        )
    }
}


export default Board;

