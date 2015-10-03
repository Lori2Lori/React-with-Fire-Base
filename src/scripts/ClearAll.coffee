React = require 'react'

module.exports = class ClearAll extends React.Component
  render: ->
    <button className="btn btn-danger"
      onClick = @props.onClearAll
    >
      clear all
    </button>
