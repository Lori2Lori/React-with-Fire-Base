React = require "react"
RDOM = require "react-dom"

module.exports = class ListItem extends React.Component
  handleClick: =>
    @props.whenItemClicked @props.item

  render: ->
    return <li><a onClick=@handleClick>{@props.item}</a></li>
