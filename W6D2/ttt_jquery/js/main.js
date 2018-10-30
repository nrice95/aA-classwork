const View = require ('./ttt-view.js');
const Game = require ('/Users/appacademy/desktop/aA-classwork/W6D2/ttt_jquery/solution/game.js');

// new Game ()

$( () => {
  const $container = $(".ttt");
  const game = new Game();
  new View (game, $container);
});
