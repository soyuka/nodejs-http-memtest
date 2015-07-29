# Memory consumption with nodejs http servers

## Data collection

1. Test with `wrk -c400 -t12 -d4m http://localhost:[PORT]/`

2. Collect data with `node memorypid.js [PID] [name].csv`

3. Generate graph with `bash tograph.sh [file].csv` (this is using gnuplot)


## Basic http server

```javascript
var http = require('http')
 
var srv = http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  return res.end('okay');
});

srv.listen(8889, '127.0.0.1', function() {
  console.log(process.pid + ' listening on 8889')
})
```

![](https://raw.githubusercontent.com/soyuka/nodejs-http-memtest/master/4minwrk/basic.png)

## Express server

```javascript
var express = require('express')
var app = express()
var os = require('os')

app.get('/', function(req, res, next) {
  return res.end()
})

console.log(process.pid)

app.listen(8888)
```

![](https://raw.githubusercontent.com/soyuka/nodejs-http-memtest/master/4minwrk/express.png)

## Sails

Use `sails new sometest && cd sometest && sails lift`, get pid and collect data.


![](https://raw.githubusercontent.com/soyuka/nodejs-http-memtest/master/4minwrk/sails.png)
