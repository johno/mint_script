$ ->
  save.bindToSaveButton()

save =
  bindToSaveButton: ->
    $('#save').on('click', ->
      save.doSave() )

  doSave: ->
    $('#content-field').val(escape(ace.edit("editor").getValue()))
    $('#script').submit()