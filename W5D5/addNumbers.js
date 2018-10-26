const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  } else if (numsLeft > 0) {
    reader.question('Give number.', answer => { sum += parseInt(answer);
      console.log(sum);
      let nextAddNumbers = addNumbers(sum, numsLeft - 1, completionCallback);
      return nextAddNumbers;
    });
    // let nextAddNumbers = addNumbers(sum, numsLeft - 1, completionCallback);
    // return nextAddNumbers;
  }
};

// console.log(addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`)));
