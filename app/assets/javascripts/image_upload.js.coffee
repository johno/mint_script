$ ->
  uploader.dragAndDrop()
  $('#script').fileupload
    dataType: "script"

window.uploader = 
  dragAndDrop: ->
    $('#editor').on('dragenter', (e) -> 
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('dragexit', (e) -> 
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('dragover', (e) -> 
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('drop', (e) ->
      e.preventDefault() 
      e.stopPropagation()

      if e.originalEvent && e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files
        file = e.originalEvent.dataTransfer.files[0]
        reader = new FileReader()

      reader.onloadend = ->
        uploader.addImageToEditor(reader.result)
      reader.readAsDataURL(file) )

  addImageToEditor: (imageUrl) ->
    ace.edit('editor').insert(("![](#{ imageUrl })"))

# http://railscasts.com/episodes/381-jquery-file-upload