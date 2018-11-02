import React from 'react';
import Tab from './tab.jsx';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { currentTab: 0 };
  }

  render() {
    let i = 0;
    const w = (350/this.props.tabs.length);
    const tabs = this.props.tabs.map((tab) => { const key = i;
    let className;
    if (key === this.state.currentTab) {
      className = "selected tab";
    } else {
      className = "tab";
    }
      i++;
      return (<p className={className} onClick={ () => { this.setState( { currentTab: key } ); } } key={ key }>{tab.title}</p>);
    });
    return (
      <>
      <div class="tabs"> { tabs } </div>
      <div class="content"> { this.props.tabs[this.state.currentTab].content }</div>
      </>
    );
  }
}

export default Tabs;
