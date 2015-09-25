React = require 'react'
RDOM = require 'react-dom'
Dropdown = require './dropdown'

options =
  title : 'Choose a dessert PLEASE' #Description on the button to open dropdown menu
  items : [ #List of items to show in the dropdown
    "Pie"
    "Coconut"
    "Apple"
    "Kitten"
  ]

element = React.createElement Dropdown, options
RDOM.render element, document.querySelector '.container'
