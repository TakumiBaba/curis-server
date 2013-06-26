$ ->
  $("button").click ->
    text = $("input").val()
    tuple = ["babascript", "return", linda.getCallbackId(), text, []]
    linda.write tuple.toString()