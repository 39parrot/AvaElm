var jsonServer = require('json-server')

var _ = require('lodash');

// Returns an Express server
var server = jsonServer.create()

// Set default middlewares (logger, static, cors and no-cache)
server.use(jsonServer.defaults())

// Add custom routes
// server.get('/custom', function (req, res) { res.json({ msg: 'hello' }) })

// Returns an Express router
var router = jsonServer.router('db.json')
router.render = function(req, res) {
  console.log("Request:", req.path)
  var originalData = res.locals.data
  console.log("Original response:", originalData)
  // TODO: dirty operation!!! - changes originalData
  var alteredData = _.map(originalData, function(person) {
    person.active = Math.random() < 0.5 ? true : false
    return person
  });
  res.json(alteredData)
}

server.use(router)

server.listen(8001)
console.log('hi');