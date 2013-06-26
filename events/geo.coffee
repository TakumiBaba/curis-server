exports.Geo = (app)->

  User = app.settings.models.User
  Tuple = app.settings.models.Tuple
  Geofence = app.settings.models.Geofence

  fetch: (req, res)->
    console.log req.params.tuplespace
    if req.params.tuplespace isnt undefined
      q = {tuplespace: req.params.tuplespace}
    else
      q = {}
    Geofence.find(q).exec (err, geofences)->
      throw err if err
      return res.send geofences

  create: (req, res)->
    latitude = req.params.latitude
    longitude = req.params.longitude
    radius = req.params.radius
    tuplespace = req.params.tuplespace
    Geofence.findOne({tuplespace: tuplespace}).exec (err, geofence)=>
      throw err if err
      unless geofence
        geofence = new Geofence
          latitude: latitude
          longitude: longitude
          radius: radius
          tuplespace: tuplespace
      geofence.save (err)=>
        throw err if err
        return res.send geofence