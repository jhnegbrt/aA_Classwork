// function sum(){
//   let result = 0
//   for (let i = 0; i < arguments.length; i++){
//     result += arguments[i]

//   }
//   return result;
// }

// console.log(sum(3, 4, 5))


//with args


Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};


//curriedSum

// sum(5)

  // const numbers = [5]
  // function _curriedSum(num){
  //   numbers.push(num)
  //   if (numbers.length === numArgs){
      
  //   }
  // }


function curriedSum(numArgs){
  const numbers = []
  function _curriedSum(num){
    numbers.push(num)
    if (numbers.length === numArgs){
      return numbers.reduce((a, b) => a + b, 0)
    } else {
      return _curriedSum
    }
  }
  return _curriedSum
}


const sum = curriedSum(4);

console.log(sum)
// console.log(sum(5)(30)(20)(1)); // => 56






