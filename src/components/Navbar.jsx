import React from 'react'
import "./Navbar.css"

const Navbar = () => {
  return (
    <div>
        <nav className='flex justify-between bg-slate-700 text-white p-5 '>
            <div className="logo mx-9">
                <span className=''>iTask</span>
            </div>
            <ul className='flex gap-8 mx-3'>
                <li className='cursor-pointer hover:font-bold transition-all'>Home</li>
                <li className='cursor-pointer hover:font-bold transition-all'>Your Task</li>
            </ul>
        </nav>
    </div>
  )
}

export default Navbar
