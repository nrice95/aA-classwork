const View = require ('/Users/appacademy/Desktop/aA-classwork/W6D2/hanoi/src/hanoi-view.js');
const Game = require ('/Users/appacademy/Desktop/aA-classwork/W6D2/hanoi/src/game.js');

console.log("yap");

$( () => {
  const rootEl = $('.hanoi');
  const game = new Game();
  new View(game, rootEl);
});
