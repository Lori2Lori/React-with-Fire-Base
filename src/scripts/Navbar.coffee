React     = require 'react'
Collapse  = require 'react-collapse'
Links     = require './Links'

module.exports = class Navbar extends React.Component
  render: ->
    <div>
      <nav className="navbar navbar-default active hidden-xs">
        <div className="container-fluid">
          <a className="navbar-brand" href="#">TODO LIST</a>
            <div className='navbar-header'>
              <Links/>
            </div>
        </div>
      </nav>

      <nav className="navbar navbar-default visible-xs-block">
        <div className="container-fluid">
          <div className='navbar-header'>
            <button
              onClick = { => @setState opened: not @state.opened }
              type='button'
              className='navbar-toggle collapsed'
              ariaExpanded='false'
            ><i className="fa fa-bars"></i></button>
            <a className="navbar-brand" href="#">TODO LIST</a>
          </div>
          <Collapse isOpened = { @state.opened } >
            <div className = 'navbar-collapse'
              id='main_navbar'>
              <Links/>
            </div>
          </Collapse>
        </div>
      </nav>
    </div>

  constructor: ->
    @state = opened: false
