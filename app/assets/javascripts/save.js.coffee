window.save =
  doSave: ->
    $('#content-field').val(ace.edit("editor").getValue())
    $('#script').submit()