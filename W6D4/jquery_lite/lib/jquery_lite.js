/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(nodeList) {\n    this.nodeList = nodeList;\n  }\n}\n\nDOMNodeCollection.prototype.html = function(string){\n  let innerHTML = this.nodeList[0].innerHTML;\n  if (typeof string !== \"undefined\"){\n    innerHTML = string;\n  }else{\n    return innerHTML;\n  }\n};\n\nDOMNodeCollection.prototype.empty = function () {\n  this.nodeList.forEach(\n    (node) => {\n      node.innerHTML = null;\n    }\n  );\n};\n\nDOMNodeCollection.prototype.append = function (element) {\n  // debugger\n  if (element instanceof DOMNodeCollection) {\n    this.nodeList.forEach(\n      (node) => {\n        element.nodeList.forEach(\n          (elNode) =>{\n            node.innerHTML += elNode.outerHTML;\n          }\n        );\n      }\n    );\n  } else if (typeof element === \"string\") {\n    this.nodeList.forEach((node) => {\n      node.innerHTML += element;\n    });\n  }\n};\n\n  DOMNodeCollection.prototype.attr = function (attribute, newVal) {\n    if (typeof newVal !== \"undefined\") {\n      this.nodeList[0].attributes[attribute].value = newVal;\n    }\n    return this.nodeList[0].attributes[attribute].value;\n  };\n\n  DOMNodeCollection.prototype.removeClass = function (className) {\n    this.nodeList.forEach(\n      (node) => {\n        if (typeof className === \"undefined\"){\n          node.className = \"\";\n        }else{\n          let result = [];\n          const arr = node.className.split(\" \");\n          arr.forEach((nodeClass) => {\n            if (nodeClass !== className){\n              result.push(nodeClass);\n            }\n          });\n          node.className = result.join(\" \");\n        }\n      }\n    );\n    return this;\n  };\n\n  DOMNodeCollection.prototype.addClass = function (newClass) {\n    this.nodeList.forEach(\n      (node) => {\n        if (node.className !== \"\"){\n          node.className += \" \";\n        }\n        node.className += newClass;\n      }\n    );\n    return this;\n  };\n\n  DOMNodeCollection.prototype.children = function() {\n    let childrenNodes = [];\n    this.nodeList.forEach((node) => {\n      node.childNodes.forEach((childNode) => {\n        if (childNode.nodeType === 1){\n          childrenNodes.push(childNode);\n          if (childNode.childNodes.length > 0){\n            childrenNodes.concat(childNode.childNodes.children());\n          }\n        }\n      });\n    });\n    return childrenNodes;\n  };\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\nwindow.$l = function(selector) {\n  if (selector instanceof HTMLElement) {\n    let nodes = document.querySelectorAll(selector);\n    let nodeArray = Array.from(nodes);\n    return new DOMNodeCollection(nodeArray);\n  }else if (selector instanceof String) {\n    let nodes = document.querySelectorAll(selector);\n    let nodeArray = Array.from(nodes);\n    return new DOMNodeCollection(nodeArray);\n  }else{\n    let nodes = document.querySelectorAll(selector);\n    let nodeArray = Array.from(nodes);\n    return new DOMNodeCollection(nodeArray);\n  }\n};\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });