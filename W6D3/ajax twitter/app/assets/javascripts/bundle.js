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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: that => {
    // ...
    return $.ajax({
      method: "POST",
      url: `/users/${that.userId}/follow`,
      dataType: 'json'
    }).then(() => {
      that.followState = "followed";
      that.render();
    }).fail(() => console.log("failed!"));
  },

  unfollowUser: that => {
    // ...
    return $.ajax({
      method: "DELETE",
      url: `/users/${that.userId}/follow`,
      dataType: 'json'
    }).then(() => {
      that.followState = "unfollowed";
      that.render();
    }).fail(() => console.log("failed!"));
  }
};

module.exports = APIUtil;

// e.preventDefault();
// if (this.followState === "unfollowed") {
//   // debugger
//   return $.ajax({
//     method: "POST",
//     url: `/users/${this.userId}/follow`,
//     dataType: 'json'
//   }).then(() => {
//     this.followState = "followed";
//     this.render();
//   }).fail(() => console.log("failed!"));
// } else {
//   // debugger
//   return $.ajax({
//     method: "DELETE",
//     url: `/users/${this.userId}/follow`,
//     dataType: 'json'
//   }).then(() => {
//     this.followState = "unfollowed";
//     this.render();
//   }).fail(() => console.log("failed!"));
// }


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class FollowToggle{
  constructor(el){
    this.$el = $(el);
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState;
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    // debugger
    if (this.followState === "unfollowed"){
      this.$el.text("Follow!");
    }else if (this.followState === "followed"){
      this.$el.text("Unfollow!");
    }else if (this.followState === "following"){
      this.$el.text("Wait! I'm trying to follow!");
    }else if (this.followState === "unfollowing"){
      this.$el.text("I'm unfollowing!");
    }else{
      this.$el.text("I'm broken, please fix me!");
    }
  }

  handleClick(e){
    e.preventDefault();
    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      return APIUtil.followUser(this);
    } else {
      this.followState = "unfollowing";
      this.render();
      return APIUtil.unfollowUser(this);
    }
  }
}

module.exports = FollowToggle;


/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

$(() => {
  const $toggles = $('.follow-toggle');
  $toggles.each( function (i, el) {
    new FollowToggle(el);
  });
  // for (let i = 0; i < $toggles.length; i++){
  //   // new FollowToggle($toggles[i]);
  //   $toggles[i].text("Haalp");
  // }
});


/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map