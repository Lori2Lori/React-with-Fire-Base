React = require 'react'

module.exports = class Form extends React.Component
  render: ->
    <ul>
      { if @props.items is null
          <h4>
            Add a todo to get started.
          </h4>
        else
          for key, value of @props.items
            do =>
              name = key
              <li key={key}>
                <input type='checkbox', class='mycheckbox'/>
                {value}

                <button className="btn btn-link"
                  onClick = { => @props.onClear name } >
                  <span className="glyphicon glyphicon-remove" />
                </button>
              </li>

      }
    </ul>
