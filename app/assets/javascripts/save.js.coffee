window.save =
  doSave: ->
    $('#content-field').val(escape(ace.edit("editor").getValue()))
    $('#script').submit()