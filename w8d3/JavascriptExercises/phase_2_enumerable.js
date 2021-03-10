function callback(num) {
  return num * num;
}
Array.prototype.my_each = function(callback) {
  for(let i = 0; i < this.length; i++){
    callback(this[i])
  }
}

Array.prototype.my_map = function (callback) {
  let array = []
  this.my_each(callback)
  
}