function Cat (name, owner) {
  this.name = name;
  this.owner = owner;
  this.cuteStatement = function () {
    return `Everyone loves ${this.name}`;
  };
}
