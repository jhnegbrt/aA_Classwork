function square(num) {
  return num * num;
}


Array.prototype.myEach = function(eachCallback) {
  for(let i = 0; i < this.length; i++){
    eachCallback(this[i])
  }
}


Array.prototype.myMap = function (mapCallback) {
  let array = []
  this.myEach( ele => {
    array.push(mapCallback(ele))
  })
  return array
  
}

Array.prototype.myReduce = function(callback, initialValue = 0){
  let arr = this
  if (!initialValue){
    initialValue = this[0]
    console.log(this.length)
    console.log(arr.length)
    arr = arr.slice(1)
  }

  arr.myEach( ele => {
    initialValue += callback(ele)
  })

  return initialValue

}




