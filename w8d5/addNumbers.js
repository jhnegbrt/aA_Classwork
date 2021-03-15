const readline = require('readline')

reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0){
    reader.question("Please enter a number!", (res) => {
      let num = parseInt(res);
      sum += num
      console.log(`Current sum: ${sum}`)
      numsLeft -= 1
      addNumbers(sum, numsLeft, completionCallback)
    })
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));