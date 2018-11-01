const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(selector) {
  if (selector instanceof HTMLElement) {
    let nodes = document.querySelectorAll(selector);
    let nodeArray = Array.from(nodes);
    return new DOMNodeCollection(nodeArray);
  }else if (selector instanceof String) {
    let nodes = document.querySelectorAll(selector);
    let nodeArray = Array.from(nodes);
    return new DOMNodeCollection(nodeArray);
  }else{
    let nodes = document.querySelectorAll(selector);
    let nodeArray = Array.from(nodes);
    return new DOMNodeCollection(nodeArray);
  }
};
