import React from 'react'
import {uniqueId} from './todo_utils'

class TodoForm extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            id: uniqueId(),
            title: "",
            body: "",
            done: false

        }
        // this.receiveTodo = props.receiveTodo.bind(this)
        this.handleBody = this.handleBody.bind(this)
        this.handleTitle = this.handleTitle.bind(this)
        this.handleDone = this.handleDone.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleTitle(e){
        this.setState({
            title: e.target.value
        })
    }
    handleBody(e){
        this.setState({
            body: e.target.value
        })
    }
    handleDone(e){
        this.setState({
            done: e.target.value
        })
    }
    handleSubmit(e){
        e.preventDefault();
        this.props.receiveTodo(this.state)
        this.setState({
            id: uniqueId(),
            title: "",
            body: "",
            done: false
        });
    }
    render(){
        return(
            <form>
                <label>Title
                    <input onChange = {this.handleTitle} type="text" value={this.state.title}/>
                </label>
                <label>Body
                    <input onChange = {this.handleBody} type="text" value={this.state.body} />
                </label>
                <label>Done
                    <label>True
                    <input onClick = {this.handleDone} type="radio" value="true"></input>
                    </label>
                    <label>False
                    <input onClick = {this.handleDone} type="radio" value="false"></input>
                    </label>
                </label>
                <input onClick = {this.handleSubmit} type="submit" value="Add Todo" />



            </form>


        )
    }



}





export default TodoForm