$.fn.initializeEditor = function(content) {
	$().activateAce();
	$().setEditorContent(content);
	$().setEditorStyling(ace.edit('editor'));
}

$.fn.activateAce = function() {
	ace.edit('editor')
		.getSession();
}

$.fn.setEditorContent = function(content) {
	ace.edit('editor')
		.getSession()
			.setValue(unescape(content));
}

$.fn.silentSave = function() {
	$('#content-field').val(
	  escape(ace.edit("editor")
			.getValue()));
	$('.form').submit();
}

$.fn.setEditorStyling = function(editor) {
  editor.getSession().setMode("ace/mode/markdown");
  editor.setTheme("ace/theme/tomorrow");
  editor.renderer.setShowGutter(false);
  editor.getSession().setTabSize(2);
  editor.getSession().setUseSoftTabs(true);
  editor.getSession().setUseWrapMode(true);
  editor.setHighlightActiveLine(false);
  editor.setShowPrintMargin(false);
}