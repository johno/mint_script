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
			.setValue(content);
}

$.fn.silentSave = function() {
	$('#content-field').val(
		ace.edit("editor")
			.getValue());
	$('.form').submit();
}

$.fn.setEditorStyling = function(editor) {
  editor.renderer.setShowGutter(false);
  editor.getSession().setTabSize(2);
  editor.getSession().setUseSoftTabs(true);
  editor.getSession().setUseWrapMode(true);
  editor.setHighlightActiveLine(false);
  editor.setShowPrintMargin(false);
}