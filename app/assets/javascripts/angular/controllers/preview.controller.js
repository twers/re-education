function PreviewController ($scope) {

  $scope.init = function (defaultImageUrl) {
    $scope.previewImageUrl = defaultImageUrl;

    $scope.uploader.bind('fileuploaddone', function (e, data) {
      var url = data.result.files[0].url;
      $scope.$apply(function() {
        $scope.previewImageUrl = url;
      });
    });
  };
  $scope.reset = function () {
    $scope.previewImageUrl = '';
  };
}