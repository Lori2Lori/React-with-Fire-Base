React = require "react"
RDOM = require "react-dom"

module.exports = class ListItem extends React.Component
  handleClick: =>
    @props.whenItemClicked @props.item
    console.log 'I was clicked'

  render: ->
    return <li><a onClick=@handleClick>{@props.item}</a></li>
