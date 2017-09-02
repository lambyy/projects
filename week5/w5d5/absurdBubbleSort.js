const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true);
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}? `, function (res) {
    if (res === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  } else if (i < arr.length - 1) {
      askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
        if (isGreaterThan) {
          [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
          madeAnySwaps = true;
        }
        i++;
        innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
      });
  }
}

// askIfGreaterThan(1, 2, (res) => console.log(res));
// innerBubbleSortLoop([3, 7, 2, 9], 0, false, (res) => console.log(res));
absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
