CKEDITOR.editorConfig = function(config) {

	config.entities_greek = false;
	config.toolbar = 'Easy';
	config.pasteFromWordRemoveStyles = true;
	config.pasteFromWordRemoveFontStyles = true;
	config.forcePasteAsPlainText = true;

	config.filebrowserBrowseUrl = '/gr/el/admin/assets?layout=iframe&select_style=true';
	config.filebrowserImageBrowseUrl = '/gr/el/admin/assets?layout=iframe&select_style=true&images_only=true';

	config.width = 720;
	config.height = 250;

	config.toolbar_Easy = [
		['Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo','-','RemoveFormat'],
		['Styles','Format'],
		['Maximize'],
		['Bold','Italic','Underline','Strike','Subscript', 'Superscript'],
		['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		['Link','Unlink','Anchor'],
		['Table','HorizontalRule','SpecialChar','PageBreak'],
		['Image','MediaEmbed'],
		['Source']
	];


	config.toolbar_Full =
		[
			{ name: 'document',    items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
			{ name: 'clipboard',   items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
			{ name: 'editing',     items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
			{ name: 'forms',       items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
			'/',
			{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
			{ name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
			{ name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
			{ name: 'insert',      items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
			'/',
			{ name: 'styles',      items : [ 'Styles','Format','Font','FontSize' ] },
			{ name: 'colors',      items : [ 'TextColor','BGColor' ] },
			{ name: 'tools',       items : [ 'Maximize', 'ShowBlocks','-','About' ] }
		];
};
