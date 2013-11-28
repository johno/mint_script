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
    ace.edit('editor').setHighlightActiveLine(true)
    ace.edit('editor').setShowPrintMargin(false)

  addShortcuts: ->
    ace.edit('editor').commands.addCommand
      name: 'togglePreview2'
      bindKey: {win: 'Ctrl-2',  mac: 'Command-2'}
      exec: ->
        column.toggleColumns(2)
      readOnly: false

    ace.edit('editor').commands.addCommand
      name: 'togglePreview1'
      bindKey: {win: 'Ctrl-1',  mac: 'Command-1'}
      exec: ->
        column.toggleColumns(1)
      readOnly: false

  initializeShowdown: ->
    converter = new Showdown.converter()
    
    editor.setPreviewWithShowdown(converter)
    ace.edit('editor').getSession().on('change', ->
      editor.setPreviewWithShowdown(converter)
      save.doSave() )

  setPreviewWithShowdown: (converter) ->
    thePreview = $('#preview')
    theBarChartRegex = /{{(bar_chart.*?)}}/g
    theHtml = converter.makeHtml(ace.edit('editor').getValue())

    thePreview.html(theHtml)
    theBarCharts = theHtml.match(theBarChartRegex)
    return unless theBarCharts && theBarCharts.length
    editor.replaceContentWithBarChart(thePreview, barChart) for barChart in theBarCharts

  replaceContentWithBarChart: (content, barChart) ->
    theHtml = content.html()
    content.html(theHtml.replace(new RegExp(barChart, "g"), "$Bar chart functionality coming soon!$"))
