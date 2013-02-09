$.fn.initializeEditor = function(content) {
	$().activateAce();
	$().setEditorContent(content);
}

$.fn.activateAce = function() {
	ace.edit('editor')
		.getSession()
			.setMode('ace/mode/ruby');
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

$(function() {
	$().initializeEditor('');
});