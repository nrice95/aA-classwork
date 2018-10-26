class Clock {
  constructor() {
    const date = new Date();
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();
    const bindTick = Clock.prototype._tick.bind(this);
    const bindPrint = Clock.prototype.printTime.bind(this);

    setInterval( function() {  bindTick(); bindPrint();}, 1000);
  }

  printTime(){
    const hours = this.hour < 10 ? '0' + this.hour : this.hour;
    const minutes = this.minute < 10 ? '0' + this.minute : this.minute;
    const seconds = this.second < 10 ? '0' + this.second : this.second;
    console.log(`${hours}:${minutes}:${seconds}`);
  }
  //
  _tick() {
    this.second++;

    if (this.second === 60){
      this.second = 0;
      this.minute++;
    }

    if (this.minute === 60){
      this.minute = 0;
      this.hour++;
    }

    if (this.hour === 24){
      this.hour = 0;
    }
  }
}

const clock = new Clock();
