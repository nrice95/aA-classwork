


const sum = function(...args){
  let sumation = 0;
  args.forEach((arg) => {sumation+=arg;} );

  return sumation;
};

const sum2 = function(){
  let sumation = 0;
  var args = Array.from(arguments);
  args.forEach((arg) => {sumation+=arg;} );

  return sumation;
};


// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  return () => this.apply(ctx);
};

Function.prototype.bindWithArgs = function(ctx, ...bindTimeArgs){
  return (...callTime) => {

    return this.apply(ctx, bindTimeArgs.concat(callTime));
  };
  // return bound(...bindTimeArgs);
};


const curriedSum = function(n){
  let numbers = [];
  return function _curriedSum(num){
    numbers.push(num);
    if (numbers.length === n) {
      return numbers.reduce((acc,el) => {
        return acc += el;
      });
    }else{
      return _curriedSum;
    }
  };
};

Function.prototype.curry = function (numArgs){
  const that = this;
  let argies = [];
  return function _currification(arg){
    argies.push(arg);
    if (argies.length === numArgs){
      return that(...argies);
    }else{
      return _currification;
    }
  };
};

Function.prototype.anomymousCurry = function (numArgs){
  let argies = [];
  const _currification = (arg) => {
    argies.push(arg);
    if (argies.length === numArgs){
      return this(...argies);
    }
    else{
      return _currification;
    }
  };
  return _currification;
};

Function.prototype.curryTwo = function(numArgs){
  const that = this;
  let argies = [];
  return function _currification(arg){
    argies.push(arg);
    if (argies.length === numArgs){
      return that.apply(null, argies);
    }else{
      return _currification;
    }
  };
};
