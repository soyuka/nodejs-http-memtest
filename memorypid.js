var pusage = require('pidusage')
var fs = require('fs')
var stream = fs.createWriteStream(process.argv[3])
var eol = require('os').EOL

setInterval(function() {
  var d = new Date()
  var s = d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds()

  pusage.stat(process.argv[2], function(err, stat) {
    stream.write([s, stat.memory, stat.cpu].join(',') + eol)
  })

}, 1000)
