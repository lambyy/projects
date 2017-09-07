const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});



class Game {
  constructor () {
    this.towers = [[3,2,1], [], []];
  }

  run(completeCallback) {
    // console.log('start');
    this.promptMove( (startTowerIdx, endTowerIdx) => {
      // console.log('inside run', this);
      this.move(startTowerIdx, endTowerIdx);
      // console.log(this.isWon);
      if (!this.isWon()) {
        console.log("inside is won", this);
        this.run(completeCallback);
      } else {
        completeCallback();
      }
    });
    // console.log('prompted move');
  }

  promptMove(callback) {
    this.print(); //prints stacks
    let [startTowerIdx, endTowerIdx] = [0, 0];
    reader.question('From which tower? : ', function (res) {
      startTowerIdx = parseInt(res);
      reader.question('To which tower? : ', function (res2) {
        endTowerIdx = parseInt(res2);
        callback(startTowerIdx, endTowerIdx);
      });
    });
    // console.log('last line of prompt move');
  }

  print() {
    this.towers.forEach( function (tower, i) {
      console.log(`Tower[${i}] : [ ${tower} ]`);
    });
    console.log("--------------------------");
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    let start = this.towers[startTowerIdx];
    let end = this.towers[endTowerIdx];

    if (start.length === 0) {
      // console.log('Not a valid move!');
      return false;
    } else if (end.length === 0) {
      return true;
    } else {
      if (start[start.length - 1] > end[end.length - 1]) {
        // console.log('Not a valid move!');
        return false;
      } else {
        return true;
      }
    }
  }

  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
      // this.print();
      // return true;
    } else {
      console.log("*****Invalid move*****");
      // return false;
    }
  }

  isWon() {
    if (this.towers[1].length === 3 || this.towers[2].length === 3) {
      return true;
    }
    return false;
  }

}

const hanoi = new Game();
// hanoi.promptMove(hanoi.move.bind(hanoi));
// console.log(hanoi.isWon());
hanoi.run( () => {
  console.log("*****Congrats, you won*****");
  reader.close();
});
