class View {
  constructor(game, $el) {
   this.game = game;
   this.$el = $el;
   this.setupBoard();
   this.bindEvents();
  }

  bindEvents() {
    $('ul').on('click', (e) => {
      this.makeMove(e.target);
      if (this.game.isOver()) {
        $('.foot').text("Game over");
        $('ul').off();
      }
    });
  }

  makeMove($square) {
    this.game.playMove($($square).data("pos"));
    $($square).toggleClass('incomplete complete');
    if (this.game.currentPlayer === "x") {
      $($square).text("X");
    } else{
      $($square).text("O");
    }
  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    for (let row = 0; row < 3; row++){
      for (let col = 0; col < 3; col++){
        const $li = $("<li></li>");
        const pos = [row,col];
        $li.data("pos", pos);
        // debugger
        $li.addClass('incomplete');
        // $li.addClass('no_symb');
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
