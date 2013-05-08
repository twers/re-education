angular.module('openClass.directives')
  .directive('jqueryFileUploader', ['eventConstants', function factory(eventConstants) {

    var directive = {
      restrict: 'C',
      link: function (scope, element, attrs) {
        var uploader = $(element).fileupload({
          url: '/uploads.json',
          type: 'POST',
          sequentialUploads: true,
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          formData: {
            _method : 'POST'
          }
        });

        uploader.bind('fileuploaddone', function (e, data) {
          scope.$emit(eventConstants.FILE_UPLOAD_DONE, data.result);
        });
      }
    };
    return directive;

  }]);