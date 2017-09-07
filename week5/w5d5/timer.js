class Clock {
  constructor() {
    let date = new Date();
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    console.log(`${this.hour}:${this.minute}:${this.second}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    this.second++;

    if (this.second === 60) {
      this.second = 0;
      this.minute++;
    }

    if (this.minute === 60) {
      this.minute = 0;
      this.hour++;
    }

    this.hour %= 24;

    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();
