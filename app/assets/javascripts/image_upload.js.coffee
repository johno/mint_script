$ ->
  uploader.dragAndDrop()

uploader = 
  dragAndDrop: ->
    $('#editor').on('dragenter', (e) -> 
      # console.log(e)
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('dragexit', (e) -> 
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('dragover', (e) -> 
      e.preventDefault() 
      e.stopPropagation() )
    $('#editor').on('drop', (e) ->
      console.log(e)
      e.preventDefault() 
      e.stopPropagation()
      file = e.originalEvent.dataTransfer.files[0]
      reader = new FileReader()
      reader.readAsDataURL(file)
      console.log(reader.result)
      console.log(file) )