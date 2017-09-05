const GameView = require('./lib/game_view.js');

document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext('2d');
  const game = new GameView(ctx);
  const startGame = game.start.bind(game);
  startGame();
});

// const game = new GameView(ctx);
// game.start.bind(game)();
