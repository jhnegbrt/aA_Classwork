import React from 'react'


const TodoList = (props) =>{
    <div>
        <ul>
            {props.todos.map((todo,idx)=>{
                <li key={idx}>Title: {todo.title}, Body: {todo.body}</li>
            })}
        </ul>


    </div>


}
export default TodoList

