Array.prototype.uniq = function () {
  let new_arr = [];
  this.forEach(function(element) {
    if (!new_arr.includes(element)) {
      new_arr.push(element);
    }
  });
  return new_arr;
};

Array.prototype.twoSum = function () {
  let pos_pairs = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        let new_arr = [i, j];
        pos_pairs.push(new_arr);
      }
    }
  }
  return pos_pairs;
};

Array.prototype.transpose = function() {
  let trans = [];
  for (let i = 0; i < this[0].length; i++){
    let new_row = [];
    for (let j = 0; j < this.length; j++){
        new_row.push(this[j][i]);
    }
    trans.push(new_row);
  }
  return trans;
};
