var React = require("react");
var Button = require("./button");
var ListItem  = require("./list-item");

module.exports = React.createClass({
  handleClick: function() {
    this.setState({open : !this.state.open})
  },
  changeHue: function() {
    this.setState({hue : this.state.hue + 50})
  },
  getInitialState: function() {
    return {open : false, hue : 115}
  },
  render: function(){
    var {
      title,
      items
    } = this.props
    var classes = this.state.open ? "show" : "hide"
    return <div className = "dropdown">
      <Button
        whenClicked = {this.handleClick}
        className   = "btn-default"
        title       = {title}
        subTitleClassName = "caret"
      />
      <div
        style = {{
          backgroundColor: "hsl(" + this.state.hue + ",100%,50%)"
        }}
        onClick = {this.changeHue}
      >
        Hello
      </div>
      <ul className = {"dropdown-menu " + classes}>
        {items.map(function(item){
          return <ListItem item = {item}/>
        })}
      </ul>
    </div>
  }
});
