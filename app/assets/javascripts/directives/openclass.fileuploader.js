angular.module('openClass.directives')
  .directive('fileUploader', ['plupload', function factory(pluploader) {

    function link(scope, tElement, tAttrs, transclude) {

      var selectBtn = angular.element('#' + tAttrs.browseBtnId);
      var fileList = tElement.find('.fileList').hide();

      function initHandler(uploader, params) {

      }

      function filesAddedHandler(uploader, files) {
        fileList.html('').show();
        for (var i = 0, len = files.length; i < len; i++) {
          var file = files[i];
          fileList.prepend(compileFileItemTmpl('', file.id, file.name + ' - ' + pluploader.formatSize(file.size)));
        }
        setTimeout(function () {
          uploader.start();
        }, 0);
      }

      function uploadProgressHandler(uploader, file) {
        var fileElem = angular.element('#' + file.id);
        fileElem.find('.progress').css('width', file.percent + '%');
        fileElem.find('.progress-value').text(file.percent + '%');
      }

      function uploadFilesProgressHandler(uploader, file) {
        var totalProgress = 0;
        for (var i = 0, len = uploader.files.length; i < len; i++) {
          totalProgress += +uploader.files[i].percent;
        }
      }

      function uploadCompleteHandler(uploader, fileArray) {
        scope.$emit('upload', 'complete');
        setTimeout(function(){
          fileList.fadeOut();
        }, 2000);
      }

      function uploadSingleFileCompleteHandler(uploader, file) {
        var fileElem = angular.element('#' + file.id);
      }

      var extensions = tAttrs.extensions || "jpg,jpeg,gif,png";
      var title = tAttrs.title || "Image files";

      var uploader = new pluploader.Uploader({
        runtimes: 'flash',
        browse_button: selectBtn[0].id,
        max_file_size: '10mb',
        file_data_name: tAttrs.fileDataName,
        url: tAttrs.filePostUrl,
        resize: {
          width: 1024, height: 768, quality: 90
        },
        flash_swf_url: '/assets/plupload/plupload.flash.swf',
        filters: [
          {title: title, extensions: extensions}
        ],
        multipart_params: { authenticity_token: angular.element('meta[name="csrf-token"]').attr('content') }
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
        '<b class="file-name">' + fileName + '</b>' +
        '<span class="progressbar">' +
        '<span class="progress"></span>' +
        '</span>' +
        '</li>';
    }

    var templateStr = '<div>' +
      '<ul class="fileList">' +
      '</ul>' +
      '</div>';

    return {
      template: templateStr,
      replace: false,
      restrict: 'C',
      link: link
    };
  }]);