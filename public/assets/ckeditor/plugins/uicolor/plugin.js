/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.plugins.add("uicolor",{requires:["dialog"],lang:["bg","cs","cy","da","de","el","en","eo","et","fa","fi","fr","he","hr","it","mk","nb","nl","no","pl","pt-br","tr","ug","uk","vi","zh-cn"],init:function(e){if(CKEDITOR.env.ie6Compat)return;e.addCommand("uicolor",new CKEDITOR.dialogCommand("uicolor")),e.ui.addButton("UIColor",{label:e.lang.uicolor.title,command:"uicolor",icon:this.path+"uicolor.gif"}),CKEDITOR.dialog.add("uicolor",this.path+"dialogs/uicolor.js"),CKEDITOR.scriptLoader.load(CKEDITOR.getUrl("plugins/uicolor/yui/yui.js")),e.element.getDocument().appendStyleSheet(CKEDITOR.getUrl("plugins/uicolor/yui/assets/yui.css"))}});