var React = require('react');

module.exports = React.createClass({
  render: function() {
    var {
      title,
      subTitle,
      className,
      subTitleClassName,
      whenClicked
    } = this.props

    return <button
      onClick   = {whenClicked}
      className = {'btn ' + className}
      type      = "button"
    >
      {this.props.title}
      <span className =  {subTitleClassName}>
        {subTitle}
      </span>

    </button>
  }
});
