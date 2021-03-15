const readline = require('readline')

reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdBubbleSort(array, sortCompletionCallback){

  function outerBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps){
      innerBubbleSortLoop(array, 0, false, outerBubbleSortLoop)
    } else {
      sortCompletionCallback(array);
      reader.close();
    }
  }
  outerBubbleSortLoop(true);
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
  
  askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
    if (isGreaterThan) {
      [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
      madeAnySwaps = true;    
    }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
  });
}

// innerBubbleSortLoop([1, 3, 2], 0, false, () => console.log('In outer bubble sort'))


function askIfGreaterThan(ele1, ele2, callback) {
  reader.question(`Is ${ele1} greater than ${ele2} (yes/no)?`, (response) => {
    if (response === 'yes') {
      callback(true);
    } else {
      callback(false);
    }
  })
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  // reader.close();
});


// askIfGreaterThan(1, 2, (boolean) => {
//   if (boolean === true){
//     console.log("true")
//   } else {
//     console.log("false")
//   }
// })

