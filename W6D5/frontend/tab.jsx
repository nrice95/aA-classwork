import React from 'react';

class Tab extends React.Component {
  constructor(props) {
    super(props);
    this.state = { content: "content" };
  }

  render() {
    return (
      <div> { this.state.content } </div>
    );
  }
}

export default Tab;
