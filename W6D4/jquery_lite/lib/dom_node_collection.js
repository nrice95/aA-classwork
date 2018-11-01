class DOMNodeCollection {
  constructor(nodeList) {
    this.nodeList = nodeList;
  }
}

DOMNodeCollection.prototype.html = function(string){
  let innerHTML = this.nodeList[0].innerHTML;
  if (typeof string !== "undefined"){
    innerHTML = string;
  }else{
    return innerHTML;
  }
};

DOMNodeCollection.prototype.empty = function () {
  this.nodeList.forEach(
    (node) => {
      node.innerHTML = null;
    }
  );
};

DOMNodeCollection.prototype.append = function (element) {
  // debugger
  if (element instanceof DOMNodeCollection) {
    this.nodeList.forEach(
      (node) => {
        element.nodeList.forEach(
          (elNode) =>{
            node.innerHTML += elNode.outerHTML;
          }
        );
      }
    );
  } else if (typeof element === "string") {
    this.nodeList.forEach((node) => {
      node.innerHTML += element;
    });
  }
};

  DOMNodeCollection.prototype.attr = function (attribute, newVal) {
    if (typeof newVal !== "undefined") {
      this.nodeList[0].attributes[attribute].value = newVal;
    }
    return this.nodeList[0].attributes[attribute].value;
  };

  DOMNodeCollection.prototype.removeClass = function (className) {
    this.nodeList.forEach(
      (node) => {
        if (typeof className === "undefined"){
          node.className = "";
        }else{
          let result = [];
          const arr = node.className.split(" ");
          arr.forEach((nodeClass) => {
            if (nodeClass !== className){
              result.push(nodeClass);
            }
          });
          node.className = result.join(" ");
        }
      }
    );
    return this;
  };

  DOMNodeCollection.prototype.addClass = function (newClass) {
    this.nodeList.forEach(
      (node) => {
        if (node.className !== ""){
          node.className += " ";
        }
        node.className += newClass;
      }
    );
    return this;
  };

  DOMNodeCollection.prototype.children = function() {
    let childrenNodes = [];
    this.nodeList.forEach((node) => {
      node.childNodes.forEach((childNode) => {
        if (childNode.nodeType === 1){
          childrenNodes.push(childNode);
          if (childNode.childNodes.length > 0){
            childrenNodes.concat(childNode.childNodes.children());
          }
        }
      });
    });
    return childrenNodes;
  };

module.exports = DOMNodeCollection;
