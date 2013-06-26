mongoose = require 'mongoose'

Schema = mongoose.Schema

TupleSpaceSchema = new Schema
  name: type: String
  tuple: type: [String]
  url: type: String
  created: type: Date, default: Date.now()
  updated: type: Date, default: Date.now()

TupleSpaceSchema.pre 'save', (next)->
  @updated = Date.now()
  return next()

UserSchema = new Schema
  name: String
  watches: [String]
  tuples: [TupleSchema]

TupleSchema = new Schema
  name: type: String
  tuples: type: String
  value: type: String, default: ""

GeofenceSchema = new Schema
  tuplespace: type: String
  latitude: type: Number
  longitude: type: Number
  radius: type: Number


module.exports =
  TupleSpace: mongoose.model 'tuplespaces', TupleSpaceSchema
  TupleSpaceSchema: TupleSpaceSchema
  User: mongoose.model 'users', UserSchema
  UserSchema: UserSchema
  Tuple: mongoose.model 'tuples', TupleSchema
  TupleSchema: TupleSchema
  Geofence: mongoose.model 'geofences', GeofenceSchema
  GeofenceSchema: GeofenceSchema