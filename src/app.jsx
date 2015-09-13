var React = require('react');
var Dropdown = require('./dropdown');

var options = {
  title : 'Choose a dessert', //Description on the button to open dropdown menu
  items : [ //List of items to show in the dropdown
    "Pie",
    "Coconut",
    "Apple",
    "Kitten"
  ]
};

var element = React.createElement(Dropdown, options);
React.render(element, document.querySelector('.container'));
