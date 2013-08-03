$ ->
  column.bindToColumnsButton()

column =
  bindToColumnsButton: ->
    $('#columns').on('click', ->
      column.toggleColumns() )

  toggleColumns: ->
    $('#editor').toggleClass('two-columns')