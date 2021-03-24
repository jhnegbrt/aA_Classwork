import React from 'react'
import Window from './window'

class Header extends React.Component{

  constructor(props){

    super(props)

    this.handleTabClick = this.handleTabClick.bind(this)

  }

  handleTabClick(e, idx){


    this.props.changePane(idx)

  }


  render(){

    const tabTitles = this.props.panes.map((tab, idx) =>{
      return <h3 onClick={() => this.handleTabClick(this, idx)} key={idx}>{tab.title}</h3>
    })

    return(

      <div className="tabs">
        <ul className="tab-titles">
          {tabTitles}
        </ul>
        <article className="pane">
          <Window content={this.props.panes[this.props.index].content}/>
        </article>
      </div>

    )
  }

}


export default Header




