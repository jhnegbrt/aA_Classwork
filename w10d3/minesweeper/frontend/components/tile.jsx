import React from 'react'
import Minesweeper from './react_minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
          bombed: false,
          flagged: false,
          explored: false,
          tileDisplay: "T"
        };

      this.handleClick = this.handleClick.bind(this)
        
    }


    addTotalVote() {
      this.setState({ totalVotes: this.state.totalVotes + 1 });
    }


    setTileDisplay(alt){
      if (alt){
        this.setState({ tileDisplay: 'F'});
      } else if (this.props.tile.bombed === true) {
        this.setState({ tileDisplay: 'B'});
      }
    }

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
      this.setTileDisplay(alt);
      // alert('clicked')
      //check to see if it is a bomb
          // if it is a bomb then you lose
      //else set explored to true and reveal adjacent bombs and return
      // set tileDisplay to return of adjacent bombs
    }

    render() {        

      return (
          <span className="tile" onClick={this.handleClick}>{this.state.tileDisplay}</span>
      )
    }
}

export default Tile;