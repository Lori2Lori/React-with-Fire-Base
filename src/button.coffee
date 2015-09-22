React = require 'react'
RDOM = require 'react-dom'

module.exports = class Button extends React.Component
  render: ->
    return <button
      onClick   = {@props.whenClicked}
      className = {'btn ' + @props.className}
      type      = "button"
    >
      {@props.title}
      <span className =  {@props.subTitleClassName}>
        {@props.subTitle}
      </span>

    </button>
