React = require 'react'

module.exports = class Form extends React.Component
  render: ->
    <div>
      <form
        onSubmit = { (event) =>
          event.preventDefault()
          unless @refs.text.value.trim() is ''
            @props.onSubmit @refs.text.value
            @refs.text.value = ''
        }
      >
        <div className="input-group">
          <input
            type="text"
            className="form-control"
            ref='text'/>

          <span className="input-group-btn">
            <input
              className="btn btn-default"
              type="submit"
              value='add'/>
          </span>

        </div>
      </form>
    </div>
