$ ->
  title_edit.hijackTitleEdit()

title_edit =
  hijackTitleEdit: ->
    $('.script_title_edit').on('change', -> 
      $(this).parent().submit() )