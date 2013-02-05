angular.module('openClass.directives')
		.directive('fileUploader', ['plupload', function factory(pluploader) {

	function link(scope, tElement, tAttrs, transclude) {

		var selectBtn = tElement.find('button').attr('id', tAttrs.id + '_pickfiles');
		var fileList = tElement.find('.fileList');

		function initHandler(uploader, params) {
			// fileList.html("<div>Current runtime: " + params.runtime + "</div>");
		}

		function filesAddedHandler(uploader, files) {
			for (var i = 0, len = files.length; i < len; i++) {
				var file = files[i];
				fileList.prepend(compileFileItemTmpl('', file.id, file.name + ' - ' + pluploader.formatSize(file.size)));
			}

			setTimeout(function () {
				uploader.start();
			}, 0);
		}

		function uploadProgressHandler(uploader, file) {
			var fileElem = $('#' + file.id);
			fileElem.find('.progress').css('width', file.percent + '%');
			fileElem.find('.progress-value').text(file.percent + '%');
		}

		function uploadFilesProgressHandler(uploader, file) {
			var totalProgress = 0;
			for (var i = 0, len = uploader.files.length; i < len; i++) {
				var file = uploader.files[i];
				totalProgress += +file.percent;
			}
			selectBtn.text('已上传' + parseInt(totalProgress / uploader.files.length) + '%');
		}

		function uploadCompleteHandler(uploader, fileArray) {
			scope.$emit('upload', 'complete');
			selectBtn.text('选择上传的文件');
		}

		function uploadSingleFileCompleteHandler(uploader, file) {
			var fileElem = $('#' + file.id);
			setTimeout(function () {
				fileElem.find('.progressbar').remove();
			}, 2000);
		}

		var extensions = tAttrs.extensions || "jpg,gif,png";
		var uploader = new pluploader.Uploader({
			runtimes:'gears,html5,flash,silverlight',
			browse_button:selectBtn[0].id,
			container:tAttrs.id,
			max_file_size:'10mb',
			file_data_name:tAttrs.fileDataName,
			url:tAttrs.filePostUrl,
			resize:{
				width:1024, height:768, quality:90
			},
			flash_swf_url:'/assets/plupload/plupload.flash.swf',
			silverlight_xap_url:'/assets/plupload/plupload.silverlight.xap',
			filters:[
				{title:"Image files", extensions:extensions}
			],
			multipart_params:{ authenticity_token:$('meta[name="csrf-token"]').attr('content') }
		});

		uploader.bind('Init', initHandler);
		uploader.bind('FilesAdded', filesAddedHandler);
		uploader.bind('UploadProgress', uploadProgressHandler);
		uploader.bind('UploadProgress', uploadFilesProgressHandler);
		uploader.bind('UploadComplete', uploadCompleteHandler);
		uploader.bind('FileUploaded', uploadSingleFileCompleteHandler);
		uploader.init();
	}

	function compileFileItemTmpl(fileSrc, fileId, fileName) {
		return '<li class="file" id="' + fileId + '">' +
//				'<img class="file" src="' + fileSrc + '"/>' +
				'<b class="file-name">' + fileName + '</b>' +
				'<span class="progressbar">' +
				'<span class="progress"></span>' +
				'<span class="progress-value"></span>' +
				'</span>' +
				'</li>';
	}

	var templateStr = '<div>' +
			'<h2>文件上传</h2>' +
			'<ul class="fileList">' +
			'</ul>' +
			'<button class="pickfiles btn btn-primary">选择文件上传</button> ' +
			'</div>';

	return {
		template:templateStr,
		replace:false,
		restrict:'A',
		link:link
	};
}]);