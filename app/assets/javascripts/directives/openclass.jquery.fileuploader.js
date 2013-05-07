angular.module('openClass.directives')
  .directive('jqueryFileUploader',
    ['eventConstants', 'base64',
      function factory(eventConstants, base64) {

        var auth = $('[name="qiniu-request-token"]').attr('content'),
          qiniuDomain = 'http://newclass.qiniudn.com';

        function getFormData(form) {
          return [
            {
              name: "auth",
              value: auth
            },
            {
              name: "action",
              value: form.find('[name="action"]').val()
            }
          ];
        }

        function addActionFormField(form) {
          var rsput = form.find('[name="action"]');
          if (rsput.length == 0) {
            rsput = $('<input type="hidden" name="action"/>').appendTo(form);
          }
          return rsput;
        }

        function constructFiles(resultFiles) {
          var files = [];
          $(resultFiles).each(function (idx, item) {
            var baseUrl = qiniuDomain + '/' + item.name;
            files.push({
              url: baseUrl,
              mediumUrl: baseUrl + '?imageView/2/w/400',
              thumbnailUrl: baseUrl + '?imageView/2/w/200'
            });
          });
          return files;
        }

        var directive = {
          restrict: 'C',
          link: function (scope, element, attrs) {
            var uploader = $(element).fileupload({
              url: 'http://up.qbox.me/upload',
              type: 'POST',
              sequentialUploads: true,
              acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
              formData: getFormData
            });

            uploader.bind('fileuploadsubmit', function (e, data) {
              var rsput = addActionFormField(data.form),
                filename = data.files[0].name;

              rsput.val('/rs-put/' + base64.URLSafeBase64Encode('newclass:' + filename));
            });

            uploader.bind('fileuploadprogressall', function(e, data) {
              scope.$emit(eventConstants.FILE_UPLOAD_PROGRESS_ALL, {
                loaded: data.loaded,
                total: data.total,
                bitrate: data.bitrate
              });
            });

            uploader.bind('fileuploaddone', function (e, data) {
              var files = constructFiles(data.files);
              scope.$emit(eventConstants.FILE_UPLOAD_DONE, { files: files });
            });
          }
        };
        return directive;
      }]);
