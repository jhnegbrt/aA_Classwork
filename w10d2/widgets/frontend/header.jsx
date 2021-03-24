import React from 'react'
import Window from './window'

class Header extends React.Component{

  constructor(props){

    super(props)

    this.handleTabClick = this.handleTabClick.bind(this)

  }

  handleTabClick(e, idx){

    debugger
    this.props.changePane(idx)

  }


  render(){

    const tabTitles = this.props.panes.map((tab, idx) =>{
      return <h3 onClick={() => this.handleTabClick(this, idx)} key={idx}>{tab.title}</h3>
    })

    // debugger

    return(

      <div>
        <ul className="tab-titles">
          {tabTitles}
        </ul>
        <article>
          <Window content={this.props.panes[this.props.index].content}/>
        </article>
      </div>

    )
  }

}


export default Header




