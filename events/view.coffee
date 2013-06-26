exports.View = (app)->

  User = app.settings.models.User
  Tuple = app.settings.models.Tuple

  List:
    index: (req, res)->
      User.findOne({name: req.params.name}).exec (err, user)->
        throw err if err
        console.log user
        return res.render "index",
          tuples: user.tuples
    add: (req, res)->
      name = req.params.name
      tuple = req.params.tuple
      User.findOne({name: name}).exec (err, user)=>
        throw err if err
        unless user
          user = new User()
          user.name = name
        flag = true
        _.each user.tuples, (uTuple)=>
          if uTuple.name is req.body.name and _.contains uTuple.tuples, req.body.tuple
            flag = false
        if flag is true
          console.log 'create tuples'
          tuple = new Tuple()
          tuple.name = req.body.name
          tuple.value = req.body.value
          user.tuples.push tuple
          tuple.save (err)=>
            throw err if err
            user.save (err)=>
              throw err if err
              return res.send tuple
        else
          return res.send ""
        # if !_.contains user.watches, tuple
        #   user.watches.push tuple
        #   user.save (err)=>
        #     throw err if err
        #     return res.send tuple
        # else
        #   return res.send ""


  door: (req, res)->
    return res.render "door"
  say: (req, res)->
    return res.render 'say'
  baba: (req, res)->
    return res.render "babascript"
  geo: (req, res)->
    return res.render "geofence"