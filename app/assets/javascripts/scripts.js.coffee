editor =
  initializeEditor: (content) ->
    editor.activateAce()
    editor.setEditorContent(content)
    editor.setEditorStyling()
    editor.initializeShowdown()

  activateAce: ->
    ace.edit('editor').getSession()

  setEditorContent: ->
    ace.edit('editor').getSession().setValue(unescape(content))

  setEditorStyling: ->
    ace.edit('editor').getSession().setMode("ace/mode/markdown")
    ace.edit('editor').setTheme("ace/theme/tomorrow")
    ace.edit('editor').renderer.setShowGutter(false)
    ace.edit('editor').getSession().setTabSize(2)
    ace.edit('editor').getSession().setUseSoftTabs(true)
    ace.edit('editor').getSession().setUseWrapMode(true)
    ace.edit('editor').setHighlightActiveLine(false)
    ace.edit('editor').setShowPrintMargin(false)

  initializeShowdown: ->
    converter = new Showdown.converter()
    editor.setPreviewWithShowdown(converter)
    ace.edit('editor').getSession().on('change', ->
      $().setPreviewWithShowdown(converter) )

  setPreviewWithShowdown: (converter) ->
    $('#preview').html(converter.makeHtml(ace.edit('editor').getValue()))