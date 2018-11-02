import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    setInterval(this.tick, 1000);
  }

  render() {
    return (
      <div class="clock">
      <h1>CLACK!</h1>
      <h2>{ this.state.time.getTime() }</h2>
      </div>
    );
  }

  tick() {
    // debugger
    console.log('hi');
    let time = new Date;
    this.setState( { time: time } );
  }
}

export default Clock;
