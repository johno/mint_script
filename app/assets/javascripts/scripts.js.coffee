$ ->
  editor.initializeEditor($('#editor').data('content'))

editor =
  initializeEditor: (content) ->
    if $('#editor').length
      editor.activateAce()
      editor.setEditorContent(content)
      editor.setEditorStyling()
      editor.initializeShowdown()
      editor.addShortcuts()

  activateAce: ->
    ace.edit('editor').getSession()

  setEditorContent: (content) ->
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

  addShortcuts: ->
    ace.edit('editor').commands.addCommand
      name: 'togglePreview'
      bindKey: {win: 'Ctrl-M',  mac: 'Command-P'}
      exec: ->
        column.toggleColumns()
      readOnly: false

  initializeShowdown: ->
    converter = new Showdown.converter()
    
    editor.setPreviewWithShowdown(converter)
    ace.edit('editor').getSession().on('change', ->
      editor.setPreviewWithShowdown(converter) )

  setPreviewWithShowdown: (converter) ->
    theHtml = converter.makeHtml(ace.edit('editor').getValue())

    $('#preview').html(theHtml)
    barCharts = theHtml.match(/{{(bar_chart.*?)}}/g)
    editor.replacePreviewContentWithBarChart(barChart) for barChart in barCharts

  replacePreviewContentWithBarChart: (barChart) ->
    theHtml = $('#preview').html()
    $('#preview').html(theHtml.replace(new RegExp(barChart, "g"), "$$Bar chart functionality coming soon!$$"))