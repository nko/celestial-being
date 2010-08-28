http = require('http');
fs = require('fs');
exec = require('child_process').exec;


// Try to look up the localhost ip.
exec("ifconfig -a | awk '/inet 8/ { print $2; }'", function (err, stdout) {
  index = fs.readFileSync(__dirname + '/index.html', 'utf8');

  if (process.env.SMF_ZONENAME && process.env.SMF_ZONENAME.length > 0) {
    index = index.replace(/yourname/g,  process.env.SMF_ZONENAME);
  }

  if (!err) {
    ipaddress = stdout.replace(/\s/g, '');
    index = index.replace(/ipaddress/g, ipaddress);
  }

  index_buffer = new Buffer(index);
  logo_buffer = fs.readFileSync(__dirname + '/logo.png');
});


server = http.createServer(function (req, res) {
  if (req.url.indexOf("/logo.png") >= 0) {
    res.writeHead(200, {'Content-Type': 'image/png'})
    res.end(logo_buffer);
  } else {
    res.writeHead(200, {'Content-Type': 'text/html'})
    res.end(index_buffer);
  }
});

port = process.env.PORT || "8000";

server.listen(Number(port));

console.log("Listening on port " + port);
