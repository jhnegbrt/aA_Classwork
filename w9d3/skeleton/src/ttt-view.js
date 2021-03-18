class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;    
    this.mark = 'x'
  
    let board= this.setupBoard();
    $el.append(board)
    this.bindEvents();


  }

  bindEvents() {
    let ul = $('ul')
    let that = this
    ul.on('click', 'li' , (event) => {
      this.makeMove(event.target);
    });
    
  }

  makeMove($square) {


    $square = $($square)
    const pos = $square.data('pos');
    if(this.game.board.isEmptyPos(pos)){
      $square.addClass('clicked')
      let mark = this.game.currentPlayer
      $square.text(mark)
      this.game.playMove(pos);
    }

    let winner = this.game.winner();
    if (winner === 'x' || winner === 'o'){
      alert(this.game.currentPlayer + ' loses!')
    }

    // let $caption = $('<p></p>')
    // $caption.text("Winner")
    // this.$el.append($caption)
  

  }

  setupBoard() {
    let ul = $('<ul>')
    for(let row = 0; row < 3; row ++){
      for(let col = 0; col < 3; col++){
        
        let li = $('<li>')
        li.data('pos', [row, col])
        ul.append(li)
      }
    }
    return ul;

  }



}


  

module.exports = View;
