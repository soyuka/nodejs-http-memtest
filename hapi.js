var Hapi = require('hapi');

// Create a server with a host and port
var server = new Hapi.Server();
server.connection({ 
    host: 'localhost', 
    port: 8887 
});

// Add the route
server.route({
    method: 'GET',
    path:'/', 
    handler: function (request, reply) {
       return reply('hello world')
    }
});

// Start the server
server.start();
