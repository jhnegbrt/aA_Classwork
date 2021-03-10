Array.prototype.uniq = function() {
  let array = []
  for(let i = 0; i < this.length; i++){

    if (!array.includes(this[i])){

      array.push(this[i]);
    }

  }
  return array;
}

Array.prototype.two_sum = () => {

  

}