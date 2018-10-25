const range = function (start, end) {
  if (start === end) {
    return [start];
  } else if (start > end) {
    return [];
  }
  return [start].concat(range(start + 1, end));
};

const sumRec = function (arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1, arr.length));
};

const exponent = function (base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp - 1);
};

const exponent2 = function (base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  } else if (exp % 2 === 0) {
    return Math.pow(exponent2(base, exp / 2), 2);
  } else if (exp % 2 !== 0) {
    return base * (Math.pow(exponent2(base, (exp - 1) / 2), 2));
  }
};

const fibonacci = function (n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  }
  let last = fibonacci(n - 1);
  return last.concat(last[last.length - 1] + last[last.length - 2]);
};

const deepDup = function (arr) {
  return arr.map(x => x.constructor === Array ? deepDup(x) : x);
};

// arr.map {|ele| ele.is_a?(Array) ? deep_dup(ele) : ele}

const bsearch = function (arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  let midIdx = Math.floor(arr.length / 2);
  let mid = arr[midIdx];
  if (mid === target) {
    return midIdx;
  }
  let leftHalf = arr.slice(0, midIdx);
  let rightHalf = arr.slice((midIdx) + 1);
  if (mid < target) {
    let rightSearch = bsearch(rightHalf, target);
    if (rightSearch !== null) {
      return rightSearch + 1 + midIdx;
    }
  } else {
    let leftSearch = bsearch(leftHalf, target);
    if (leftSearch !== null) {
      return leftSearch;
    }
  }
  return -1;
};

const merge = function(left,right){
  if (left.length === 0){
    return right;
  }else if (right.length === 0){
    return left;
  }
  if (left[0] < right[0]){
    return [left[0]].concat(merge(left.slice(1),right));
  }else{
    return [right[0]].concat(merge(right.slice(1),left));
  }
};

const mergesort = function (arr) {
  if (arr.length === 1){
    return arr;
  }
  let midIdx = Math.floor(arr.length / 2);
  let left = arr.slice(0,midIdx);
  let right = arr.slice(midIdx);

  let mergedLeft = mergesort(left);
  let mergedRight = mergesort(right);

  return merge(mergedLeft,mergedRight);
};

const subsets = function (arr) {
  if (arr.length === 0){
    return [arr];
  }else if (arr.length === 1){
    return [[],arr];
  }
  let subArr = arr.slice(0,-1);
  let oldSubs = subsets(subArr);
  return oldSubs.concat(oldSubs.map(x => x.concat([arr[arr.length-1]])));

  // let sub_arr = arr.slice(1);
  // return subsets(arr.slice(0,-1)).concat(subsets(arr.slice(0,-1)).concat(arr[arr.length-1]));
};

// [1,2,3]
// [], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]
