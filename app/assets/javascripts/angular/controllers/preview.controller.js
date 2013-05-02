function PreviewController ($scope, eventConstants) {

  $scope.init = function (defaultImageUrl) {
    $scope.previewImageUrl = defaultImageUrl;
  };

  $scope.reset = function () {
    $scope.previewImageUrl = '';
  };

  $scope.$on(eventConstants.FILE_UPLOAD_DONE, function (e, data) {
    var url = data.files[0].url;
    $scope.$apply(function () {
      $scope.previewImageUrl = url;
    });
  });
}