exports.Tuple = (app)->

  TupleSpace = app.settings.models.TupleSpace
  create: (req, res)->
    return res.send "create"

  fetch: (req, res)->
    if !req.params.name
      params = {}
    else
      params = {name: req.params.name}
    TupleSpace.find(params).exec (err, ts)->
      return res.send ts

  modify: (req, res)->
    return res.send "modify"

  delete: (req, res)->
    return res.send "delete"