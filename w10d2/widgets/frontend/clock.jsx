import React from 'react';
//import { render } from 'react-dom';


class Clock extends React.Component{
    constructor() {
        super();
        this.state = {
            time: new Date(),
            // when time updated, hours....will not be updated
            // hour: time.getHours(),
            // minute: time.getMinutes(),
            // second: time.getSeconds(),
            // date: time.toDateString(),
        }
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({
            time: new Date()
        })
    }

    componentDidMount(){
        setInterval(this.tick, 1000);
    }

    




    render(){
        return(
            <div>
                <h1>Our Clock</h1>
                {this.state.time.getSeconds()}
               {this.state.time.toDateString()}
            </div>
        )
    }
}

//module.exports = Clock;
export default Clock;