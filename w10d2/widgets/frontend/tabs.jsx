import React from 'react'
import Header from './header'
import Window from './window'

class Tabs extends React.Component{

  constructor(props){
    super(props)
    this.state = {
      index: 0
    };

    // this.currentContent = 

    this.changePane = this.changePane.bind(this)
  }



  changePane(num){

    this.setState(
      { index: num}
    )

  }
  

  render(){
    
    const index = this.state.index
    const panes = this.props.panes
    return(
      <div>
      <h1>Our Tabs</h1>
      <div>
        <div>
          <Header changePane = {this.changePane} panes={panes} index={index}/>
        </div>
      </div>
    </div>
    )


  }

}

export default Tabs;
