Array.prototype.bubbleSort = function() {
  let sorted = false
  while (sorted === false){
    sorted = true
    let i = 0
    while (i < this.length - 1){
      if (this[i] > this[i + 1]){
        sorted = false
        console.log(this[i], this[i + 1] = this[i + 1], this[i])
        i = 0
      }else{
        i += 1
      }
    }
  }

  return this
}