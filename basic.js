var http = require('http')
 
var srv = http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  return res.end('okay');
});

srv.listen(8889, '127.0.0.1', function() {
  console.log(process.pid + ' listening on 8889')
})
