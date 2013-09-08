$ ->
  column.bindToColumnsButton()

window.column =
  bindToColumnsButton: ->
    $('#columns').on('click', ->
      column.toggleColumns() )

  toggleColumns: (columns = 0) ->
    if columns == 0
      $('#editor').toggleClass('two-columns')
      $('#preview').toggleClass('hidden')
    else if columns == 1
      $('#editor').removeClass('two-columns')
      $('#preview').addClass('hidden')
    else if columns == 2
      $('#editor').addClass('two-columns')
      $('#preview').removeClass('hidden')