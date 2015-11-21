React = require 'react'

module.exports = class Navbar extends React.Component
  render: ->
    <nav className="navbar navbar-default">
      <div className="container-fluid">

        <div className='navbar-header'>
          <button
            onClick = { => @setState collapsed: not @state.collapsed }
            type='button'
            className='navbar-toggle collapsed'
            ariaExpanded='false'
          ><i className="fa fa-bars"></i></button>
        </div>

        <div
          className = { [
            'navbar-collapse'
            'collapse' if @state.collapsed
          ].join ' ' }
          id='main_navbar'>
          <ul className="nav navbar-nav">
            <li><a href="#">TODO LIST</a></li>
            <li><a href="#">ABOUT THIS APP</a></li>
          </ul>
        </div>

      </div>
    </nav>

  constructor: ->
    @state = collapsed: true
