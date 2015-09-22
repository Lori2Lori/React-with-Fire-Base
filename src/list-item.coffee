React = require "react"
RDOM = require "react-dom"

module.exports = class ListItem extends React.Component
  render: ->

    return <li><a>{@props.item}</a></li>
