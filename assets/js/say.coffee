$ ->
  $("button.say").click ->
    text = $("input").val()
    console.log text
    linda.write "delta", "say", text