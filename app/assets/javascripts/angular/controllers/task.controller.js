function TaskController($scope, eventConstants) {
  $scope.uploadProgress = '';
  $scope.showUploadProgress = false;

  $scope.$on(eventConstants.FILE_UPLOAD_DONE, function (e, data) {
    $(data.files).each(function(idx, file) {
      $scope.$broadcast(eventConstants.EDITOR_APPEND_VALUE, '<img src="' + file.mediumUrl + '"/>');
    });
  });

  $scope.$on(eventConstants.FILE_UPLOAD_PROGRESS_ALL, function (e, data) {
    $scope.$apply(function() {
      $scope.uploadProgress = parseInt((data.loaded / data.total).toFixed(2) * 100);
      $scope.showUploadProgress = $scope.uploadProgress != 100;
    });
  });
}