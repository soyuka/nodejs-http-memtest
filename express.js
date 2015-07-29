var express = require('express')
var app = express()
var os = require('os')

app.get('/', function(req, res, next) {
  return res.end()
})

console.log(process.pid)

app.listen(8888)
