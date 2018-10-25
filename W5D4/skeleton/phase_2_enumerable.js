// function callbackX (el1,el2) {
//   return el1 + el2;
// }
//

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++){
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  let result = [];
  for (let i = 0; i < this.length; i++){
    result.push(callback(this[i]));
  }
  return result;
};

Array.prototype.myReduce = function (callback, initialValue) {
  let includeFirst = (initialValue ? true : false);
  let init = (initialValue ? initialValue : this[0]);
  let acc = init;
  if (includeFirst){
    acc = callback(acc, this[0]);
  }
  for (let i = 1; i < this.length; i++){
    acc = callback(acc, this[i]);
  }
  return acc;
};
