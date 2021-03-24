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
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        clearInterval(this.intervalId)
    }


    render(){
        let hour = this.state.time.getHours();
        let minute = this.state.time.getMinutes();
        let second = this.state.time.getSeconds();

        return(
            <div className="clock">
                <h1>Our Clock</h1>
                <div className="date-time">
                    <h3>Time: {hour} : {minute} : {second} PDT</h3>
                    <h3>Date: {this.state.time.toDateString()}</h3>
                </div>
            </div>
        )
    }
}

//module.exports = Clock;
export default Clock;