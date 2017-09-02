const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }

  if (numsLeft > 0) {
    reader.question('What is your number?:', function(number){
      let input = parseInt(number);

      sum += input;
      console.log(`Current sum is: ${sum}.`);

      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  }

}

addNumbers(5, 4, sum => console.log(`Total Sum: ${sum}`));
