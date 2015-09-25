React = require "react"
RDOM = require "react-dom"
Button = require "./button"
ListItem  = require "./list-item"

module.exports = class Dropdown extends React.Component
  handleClick: =>
    @setState open : not @state.open

  constructor: ->
    @state = open : false

  handleItemClick: (item) =>
    @setState
      open : false,
      itemTitle : item

  render: ->
    <div className = "dropdown">
      <Button
        whenClicked = { @handleClick }
        className   = "btn-default"
        title       = { @state.itemTitle or @props.title }
        subTitleClassName = "caret"
      />
      <ul className = {
        "dropdown-menu #{if @state.open then 'show' else 'hide'}"
        }>
        {
          for item, index in @props.items
            <ListItem
              key = {index}
              item = { item }
              whenItemClicked={@handleItemClick}
            />
        }
      </ul>
    </div>
