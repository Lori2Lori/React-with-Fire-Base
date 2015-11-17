React     = require 'react'
RDOM      = require 'react-dom'
ReactFire = require 'reactfire'
Firebase  = require 'firebase'
Form      = require './Form'
List      = require './List'
ClearAll  = require './ClearAll'

db        = new Firebase "https://incandescent-torch-1275.firebaseio.com/"

items     = db.child 'items'

class Hello extends React.Component
  render: ->
    <div className="row panel panel default">
      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <ul className="nav navbar-nav">
            <li className="active"><a href="#">TODO LIST</a></li>
            <li><a href="#">ABOUT THIS APP</a></li>
          </ul>
        </div>
      </nav>
      <div className="col-md-8 col-md-offset-2">
        <h2 className="text-center">
          TODO List
        </h2>

        <Form
          onSubmit = { (value) => items.push value }
        />
        <div className={
          "content #{if @state.loaded then 'loaded' else ''}"
        }>
        <hr/>

          <List
            items = { @state.items }
            onClear = { (name) =>
              items
                .child name
                .remove()
            }
            onClearAll = { => do items.remove }          />
        </div>

        <ClearAll onClearAll = { => do items.remove } />

      </div>
    </div>

  constructor: ->
    @state = items: {}

  componentWillMount: ->
    items
      .on 'value', (snapshot) =>
        @setState items: snapshot.val(), loaded: true

element = React.createElement Hello
RDOM.render element, document.querySelector '.container'
