/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.plugins.add("docprops",{init:function(e){var t=new CKEDITOR.dialogCommand("docProps");t.modes={wysiwyg:e.config.fullPage},e.addCommand("docProps",t),CKEDITOR.dialog.add("docProps",this.path+"dialogs/docprops.js"),e.ui.addButton("DocProps",{label:e.lang.docprops.label,command:"docProps"})}});