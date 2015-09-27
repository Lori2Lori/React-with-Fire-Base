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
        <input type="text" ref='text'/>
        <input type="submit" value='click'/>
        <button
          onClick = @props.onClear
        >
          clear
        </button>
      </form>
    </div>
