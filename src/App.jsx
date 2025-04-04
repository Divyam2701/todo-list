import { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { v4 as uuidv4 } from 'uuid';

function App() {
  const [todo, setTodo] = useState("")
  const [todos, setTodos] = useState([])//hooks

  useEffect(() => {
    let todoString = localStorage.getItem("todos")
    if (todoString) {
      let todos = JSON.parse(localStorage.getItem("todos"))
      setTodos(todos)
    }
  }, [])
  
  const handleChange = (e) => {
    // setTodo([...todos, {todo, isCompleted: false}])
    setTodo(e.target.value)
  }
  
  const handleAdd = () => {
    setTodos([...todos, { id: uuidv4(), todo, isCompleted: false }])
    setTodo("")
    console.log(todos)
    saveToLocals()
  }

  const saveToLocals = (params) => {
    localStorage.setItem("todos", JSON.stringify(todos))
  }

  const handleEdit = (e, id) => {
    let t = todos.filter(i => i.id == id)
    setTodo(t[0].todo)
    let newTodos = todos.filter(item => {
      return item.id != id;
    })
    setTodos(newTodos)
    saveToLocals()
  }

  const handleDelete = (e, id) => {
    // let c = prompt("Do you really want to Delete this Todo??? Yes or No")
    // if(c=="yes"){
    let newTodos = todos.filter(item => {
      return item.id != id;
    })
    setTodos(newTodos)
    // }
    // else if(c=="no"){
    //   return 1
    // }
    saveToLocals()
  }


  const handleCheckBox = (e) => {
    const id = e.target.name;

    const updatedTodos = todos.map(todoItem => {
      if (todoItem.id === id) {
        return { ...todoItem, isCompleted: !todoItem.isCompleted };
      } else {
        return todoItem;
      }
    });

    setTodos(updatedTodos);
    saveToLocals()
  };

  return (
    <>
      <Navbar />

      <div className="container mx-auto bg-slate-300 my-5 rounded-xl p-5 min-h-[80vh]">

        <div className="addTodo my-5">
          <h1 className='text-lg font-bold'>Add a Todo</h1>

          {/* For the input Bar */}
          <input onChange={handleChange} value={todo} type="text" className='w-80 rounded-lg p-2' />

          {/* For the Button to Add */}
          <button onClick={handleAdd} disabled={todo.length <= 3} className='bg-slate-500 hover:bg-slate-400  rounded-lg p-2 mx-6 text-sm font-bold'>Save</button>

        </div>

        <h2 className='text-xl'>Your To-Do's</h2>

        <div className="todos">
          {todos.length === 0 && <div className='m-5'>Empty Todos List</div>}
          {todos.map(item => {

            return <div key={item.id} className="todo flex w-1/4 justify-between my-3">
              <div className='flex gap-7 '>
                {/* For CheckBox */}
                <input type="checkbox" onChange={handleCheckBox} value={item.isCompleted} name={item.id} />

                {/* All the Todos */}
                <div className={`${item.isCompleted ? "line-through" : ""} flex items-center`} >{item.todo}</div>
              </div>

              {/* For Buttons */}
              <div className="buttons">
                <button onClick={(e) => { handleEdit(e, item.id) }} className='bg-slate-500 hover:bg-slate-400 rounded-lg p-2 mx-1 text-sm font-bold'>Edit</button>
                <button onClick={(e) => { handleDelete(e, item.id) }} className='bg-slate-500 hover:bg-slate-400 rounded-lg p-2 mx-1 text-sm font-bold'>Delete</button>

              </div>
            </div>
          })}
        </div>
      </div>
    </>
  )
}

export default App
