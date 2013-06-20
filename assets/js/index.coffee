$ ->
  $("ul li").each ()->
    console.log $(@).html()
    linda.setTuple $(@).html()

  $("button.add").click ()=>
    console.log "add!"
    name = $("input.name").val()
    value = $("input.tuple").val()
    console.log name, value
    $.ajax
      type: "POST"
      url: "/views/list/takumibaba/#{name}"
      data:
        name: name
        value: value
      success:(data)->
        console.log data
        if data isnt ""
          $("input.tuplename").val("")
          $("#content ul").append "<li>#{data.name}:#{data.value}</li>"