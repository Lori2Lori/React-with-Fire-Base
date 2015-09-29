React = require 'react'

module.exports = class Form extends React.Component
  render: ->
      <ul>
        {
          for key, value of @props.items
            do =>
              name = key
              <li key={key}>
                {value}

                <button className="btn btn-link"
                  onClick = { => @props.onClear name } >
                  <span className="glyphicon glyphicon-remove" />
                </button>
              </li>
        }
      </ul>
