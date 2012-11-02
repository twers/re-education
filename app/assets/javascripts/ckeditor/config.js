CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'MyToolbar';
 
	config.toolbar_MyToolbar =
	[
		{ name: 'styles', items : [ 'Format','RemoveFormat' ] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Strike' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
    { name: 'insert', items : ['Image']},
		{ name: 'links', items : [ 'Link','Unlink' ] }
	];
};