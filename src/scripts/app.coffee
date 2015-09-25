React = require 'react'
RDOM = require 'react-dom'

class Hello extends React.Component
  render: ->
    <h1 className="red">
      Hello!
    </h1>

element = React.createElement Hello
RDOM.render element, document.querySelector '.container'
