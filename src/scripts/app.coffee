React     = require 'react'
RDOM      = require 'react-dom'
ReactFire = require 'reactfire'
Firebase  = require 'firebase'

db        = new Firebase "https://incandescent-torch-1275.firebaseio.com/"

items     = db.child 'items'

class Hello extends React.Component
  render: ->
    <div>
      <h1 className="red">
        Hello!
      </h1>
      <form
        onSubmit = { (event) =>
          event.preventDefault()
          unless @refs.text.value.trim() is ''
            items.push @refs.text.value
            @refs.text.value = ''
        }
      >
        <input type="text" ref='text'/>
        <input type="submit" value='click'/>
        <button
          onClick = { =>
            items.set null
          }
        >
          clear
        </button>
      </form>
      <ul>
        {
          for key, value of @state.items
            do =>
              name = key
              <li key={key}>
                {value}
                <button
                  onClick = { =>
                    items
                      .child name
                      .remove()
                  }
                >
                  delete
                </button>
              </li>
        }
      </ul>
    </div>

  constructor: ->
    @state = items: {}

  componentWillMount: ->
    items
      .on 'value', (snapshot) =>
        @setState items: snapshot.val()

element = React.createElement Hello
RDOM.render element, document.querySelector '.container'
