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
                <button className="btn btn-default"
                  onClick = { => @props.onClear name } >
                  delete
                </button>
              </li>
        }
      </ul>
