React = require 'react'

module.exports = class Clear extends React.Component
  render: ->
    <button className="btn btn-danger"
      onClick = @props.onClear
    >
      clear all
    </button>
