import React from 'react'
import TodoListItem from './todo_list_item'


const TodoList = (props) =>{

    {console.log(props.todos)}
    return(
    <div>
        <ul>
            {props.todos.map((todo, idx)=>
                <TodoListItem todo={todo}/>
                // <li key={idx}>Title: {todo.title}, Body: {todo.body}</li>
            )}
        </ul>
    </div>

    )
}




export default TodoList




