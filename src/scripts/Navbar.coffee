React = require 'react'
RDOM  = require 'react-dom'

module.exports = class Navbar extends React.Component
  render: ->
    <nav className="navbar navbar-default">
      <div className="container-fluid">

        <div className='navbar-header'>
          <button
            type='button'
            className='navbar-toggle collapsed'
            dataToggle='collapse'
            dataTarget='#main_navbar'
            ariaExpanded='false'
          >OPEN</button>
        </div>
        <div
          className='collapse navbar-collapse'
          id='main_navbar'>
          <ul className="nav navbar-nav">
            <li><a href="#">TODO LIST</a></li>
            <li><a href="#">ABOUT THIS APP</a></li>
          </ul>
        </div>

      </div>
    </nav>

element = React.createElement Navbar
RDOM.render element, document.querySelector '.container'
