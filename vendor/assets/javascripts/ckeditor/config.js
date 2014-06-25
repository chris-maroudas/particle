
CKEDITOR.editorConfig = function(config) {

	config.entities_greek = false;
	config.toolbar = 'Easy';
	config.pasteFromWordRemoveStyles = true;
	config.pasteFromWordRemoveFontStyles = true;
	config.forcePasteAsPlainText = true;

	config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
	config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
	config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
	config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
	//config.filebrowserBrowseUrl = '/gr/el/admin/assets?layout=iframe&select_style=true';
	//config.filebrowserImageBrowseUrl = '/gr/el/admin/assets?layout=iframe&select_style=true&images_only=true';

	config.width = 802;
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
};