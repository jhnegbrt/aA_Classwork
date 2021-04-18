const mongoose = require('mongoose')
const express = require("express")
const app = express()
const db = require('./config/keys').mongoURI
const port = process.env.PORT || 5000
const users = require("./routes/api/users")
const tweets = require("./routes/api/tweets")
const User = require('./models/User');

const bodyParser = require('body-parser');

mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

app.use(bodyParser.urlencoded({
  extended: false
}))

app.use(bodyParser.json())

app.get("/", (req, res) => {
  const user = new User({
    handle: "1",
    email: "1",
    password: "1"
  })
  user.save()
  res.send('Hello World')

})

app.use("/api/users", users)
app.use("/api/users", tweets)


app.listen(port, () => console.log(`Server is running on port ${port}`))

process.once('SIGUSR2', function () {
  process.kill(process.pid, 'SIGUSR2');
});

process.on('SIGINT', function () {
  // this is only called on ctrl+c, not restart
  process.kill(process.pid, 'SIGINT');
});