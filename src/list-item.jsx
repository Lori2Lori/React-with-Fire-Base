var React = require("react");

module.exports = React.createClass({
  render: function() {
    var {
      item
    } = this.props

    return <li><a>{item}</a></li>
  }
});
