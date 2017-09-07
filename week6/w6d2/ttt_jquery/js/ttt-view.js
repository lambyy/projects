class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $cells = $('.cell');
    $cells.on({
      mouseover: function(e) {
      const $currentCell = $(e.currentTarget);
      $currentCell.addClass("orange");
      },
      mouseleave: function() {
        $(".orange").removeClass("orange");
      }
    });

    $cells.on("click", function(e) {
      const $currentCell = $(e.currentTarget);
      const pos = $currentCell.data("pos");
      this.game.playMove(pos);
      this.makeMove($currentCell);
    }.bind(this));
  }

  makeMove($square) {
    $square.addClass("white");
    $square.text(this.game.currentPlayer);
    if (this.game.winner()) {
      alert(`Congratulations, ${this.game.currentPlayer} won!`);
    }
  }

  setupBoard() {
    const $grid = $("<ul class=\"grid\"></ul>");
    this.$el.append($grid);

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $cell = $("<li class=\"cell\"></li>");
        $cell.data("pos", [i, j]);
        $grid.append($cell);
      }
    }

  }
}

module.exports = View;
