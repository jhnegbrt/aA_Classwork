import React from 'react'
import Minesweeper from './react_minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props)

        // debugger
        // // 
        // if (props.tile.explored === true && props.tile.adjacentBombCount() !== 0){
        //   this.state = {tileDisplay: props.tile.adjacentBombCount()}
        // } else {
        //   this.state = {tileDisplay: ""}
        // }

      this.handleClick = this.handleClick.bind(this)
      // this.setTitleDisplay = this.setTitleDisplay.bind(this)
        
    }


    handleClick(e){

  
 
      const alt = e.altKey
      const tile = this.props.tile
      this.props.updateGame(tile, alt)


    }

    render() { 
 
      const flagged = this.props.tile.flagged
      const explored = this.props.tile.explored
      const bombed = this.props.tile.bombed

      let toDisplay;

      if(explored && !bombed){

        let count = this.props.tile.adjacentBombCount();
        toDisplay = (count > 0 ? `${count} ` : "");
 
      }

      return (
          <div className={`tile ${flagged ? "flagged" : ""} ${explored ? "explored" : ""} ${bombed && explored ? "bombed" : ""}`} onClick={this.handleClick}>{toDisplay}</div>
      )
    }
}

export default Tile;