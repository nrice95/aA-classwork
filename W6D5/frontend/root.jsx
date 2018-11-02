import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const Root = () => {
  const tabs = [{title: "tab1", content: "content"}, {title: "tab2", content: "content2"}];
  return (
    <>
    <Clock/>
    <Tabs tabs={ tabs }/>
    </>
  );
};

export default Root;
