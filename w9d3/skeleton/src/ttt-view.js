class View {
  constructor(game, $el) {}

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {}
}

View.prototype.setupBoard = function(){
  
  let ul = $('<ul>')
  for(let row = 0; row < 3; row ++){
    for(let col = 0; col < 3; col++){
      //
      let li = $('<li>')
      ul.append(li)
      //
    }
  }

}

module.exports = View;
