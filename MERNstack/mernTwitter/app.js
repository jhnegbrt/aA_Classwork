const mongoose = require('mongoose')
const express = require("express")
const app = express()
const db = require('./config/keys').mongoURI
const port = process.env.PORT || 5000
const users = require("./routes/api/users")
const tweets = require("./routes/api/tweets")
const User = require('./models/User');
const passport = require('passport');

const bodyParser = require('body-parser');

mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

app.use(bodyParser.urlencoded({
  extended: false
}))

app.use(bodyParser.json())

app.use(passport.initialize());
require('./config/passport')(passport);

app.use("/api/users", users)
app.use("/api/tweets", tweets)


app.listen(port, () => console.log(`Server is running on port ${port}`))

process.once('SIGUSR2', function () {
  process.kill(process.pid, 'SIGUSR2');
});

process.on('SIGINT', function () {
  // this is only called on ctrl+c, not restart
  process.kill(process.pid, 'SIGINT');
});