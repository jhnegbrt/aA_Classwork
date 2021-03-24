import React from 'react'

class Tabs extends React.Component{

  constructor(props){
    super(props)
    this.state = {
      index: 0
    };

    this.handleTabClick = this.handleTabClick.bind(this)
  }

  handleTabClick(){

  }

  render(){
    <div>
      <h1>Our Tabs</h1>
      <div>
        <header>
          <Header panes={this.props.panes} index={this.state.index} handleClick={this.handleTabClick}/>
        </header>
        <div><article>{this.props.panes[this.state.index].content}</article></div>
      </div>
    </div>

  }

}
