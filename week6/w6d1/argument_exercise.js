// function sum() {
//   const numbers = Array.from(arguments);
//   return numbers.reduce( function (acc, num) {
//     return acc + num;
//   });
// }

// function sum(...args) {
//   return args.reduce( function (acc, num) {
//     return acc + num;
//   });
// }
//
// console.log(sum(1, 2, 3, 4, 5));
//
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function myBind(context) {
  const args = Array.prototype.slice.call(arguments, 1);

  return (...sayArgs) => {
    console.log(sayArgs);
    this.apply(context, args.concat(sayArgs));
  };
};

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      return numbers.reduce( function (acc, num) {
        return acc + num;
      });
    }
    return _curriedSum;
  }

  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56


// Function.prototype.curry = function(numArgs) {
//   const args = [];
//   const fn = this;
//
//   function _curry(n) {
//     args.push(n);
//     if (args.length < numArgs) {
//       return _curry;
//     }
//     return fn.apply(null, args);
//   }
//   return _curry;
// };

Function.prototype.curry = function(numArgs) {
  const args = [];
  const fn = this;

  function _curry(n) {
    args.push(n);
    if (args.length < numArgs) {
      return _curry;
    }
    return fn(...args);
  }
  return _curry;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree(4, 20, 6));

console.log('curry sumThree', sumThree.curry(3)(4)(20)(6));
