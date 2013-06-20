path = require 'path'

global._ = require 'underscore'
global.moment = require 'moment'

express = require 'express'

mongoose = require 'mongoose'
mongoose.connect "mongodb://localhost/babascript"

require.all = require 'direquire'

connect =
  session: new ((require 'connect-mongo') express)
    mongoose_connection: mongoose.connections[0]
  assets: require "connect-assets"
  static: require "st"


app = express()
app.set "port", 1217
app.set "events", require.all "events"
app.set "models", require.all "models"
app.set "helper", require.all "helper"
app.set "views", path.resolve "views"
app.set "view engine", "jade"
app.use connect.assets()
app.use express.logger "dev"
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.session
  secret: "hogefuga"
  store: connect.session
app.use app.router
app.use connect.static
  path: path.resolve "public"
  url: "/"
  index: no
  passthrough: yes

# Routes
Tuple = app.get("events").Tuple app
View = app.get("events").View app

app.get "/", Tuple.fetch
app.get "/:name", Tuple.fetch
app.post "/", Tuple.create
app.put "/:id", Tuple.modify
app.delete "/:id", Tuple.delete

app.get "/views/door", View.door
app.get "/views/:space/door", View.door
app.get "/views/list/:name", View.List.index
app.get "/views/list/:name/:tuple", View.List.add
app.post "/views/list/:name/:tuple", View.List.add

server = require("http").createServer app
server.listen app.get 'port'