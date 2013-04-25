angular.module('openClass.directives')
  .directive('jqueryFileUploader', function factory() {

    var directive = {
      restrict: 'C',
      link: function (scope, element, attrs) {
        scope.uploader = $(element).fileupload({
          url: '/uploads.json',
          type: 'POST',
          sequentialUploads: true,
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          formData: {
            _method : 'POST'
          }
        });
      }
    };
    return directive;

  });