import React from 'react'
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'


const TodoList = (props) =>{

    {console.log(props.todos)}
    return(
    <div>
        <ul>
            {props.todos.map((todo, idx)=>
                <TodoListItem todo={todo} receiveTodo = {props.receiveTodo} removeTodo = {props.removeTodo}/>
                // <li key={idx}>Title: {todo.title}, Body: {todo.body}</li>
            )}
        </ul>
        <TodoForm receiveTodo = {props.receiveTodo}/>
    </div>

    )
}




export default TodoList




