$ ->
  escape.escapeJs()

escape =
  escapeJs: ->
    $('.js-escape').each( ->
      $(this).html(unescape($(this).data('unescaped-js'))) )