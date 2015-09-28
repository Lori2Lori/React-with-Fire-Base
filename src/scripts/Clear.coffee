React = require 'react'

module.exports = class Clear extends React.Component
  render: ->
    <button className="btn btn-default"
      onClick = @props.onClear
    >
      clear all
    </button>
