$ ->
  escape.escapeJs()

escape =
  escapeJs: ->
    converter = new Showdown.converter()
    
    $('.js-escape').each( ->
      $(this).html(converter.makeHtml(unescape($(this).data('unescaped-js')))) )