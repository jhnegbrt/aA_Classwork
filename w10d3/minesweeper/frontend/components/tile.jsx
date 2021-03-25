import React from 'react'
import Minesweeper from './react_minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
          bombed: false,
          flagged: false,
          explored: false,
          tileDisplay: ""
        };

      this.handleClick = this.handleClick.bind(this)
      // this.setTitleDisplay = this.setTitleDisplay.bind(this)
        
    }


    // setTitleDisplay(alt){

      
      
    //   if (alt){
    //     this.props.tile.flagged();
    //   } else if (this.props.tile.bombed === true) {
    //     this.props.tile.explore();
    //   }
      
    // }

    //"&#128163" 

      // if(this.props.bombed === false && this.props.flagged === false && this.props.explored === false){
      //   this.setState({ tileDisplay = "T" });
      // } else if (this.props.bombed === false && this.props.flagged === false && this.props.explored === true){
      //   this.setState({ tileDisplay = "E" });
      // } else if (this.props.flagged === true) {
      //   this.setState({ tileDisplay = "&#128681" });
      // } else 

    handleClick(e){

  
 
      const alt = e.altKey
      const tile = this.props.tile
      this.props.updateGame(tile, alt)


    }

    render() { 
 
      const flagged = this.props.tile.flagged
      const explored = this.props.tile.explored

      return (
          <div className={`tile ${flagged ? "flagged" : ""} ${explored ? "explored" : ""}`} onClick={this.handleClick}>{this.state.tileDisplay}</div>
      )
    }
}

export default Tile;