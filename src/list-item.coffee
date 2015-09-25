React = require "react"
RDOM = require "react-dom"

module.exports = class ListItem extends React.Component
  handleClick: =>
    @props.whenItemClicked @props.item

  render: ->
    console.log @props
    <li className={@props.className}>
      <a onClick=@handleClick>{@props.item}</a>
    </li>
