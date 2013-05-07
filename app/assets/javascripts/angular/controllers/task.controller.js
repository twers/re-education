function TaskController($scope, eventConstants) {
  $scope.$on(eventConstants.FILE_UPLOAD_DONE, function (e, data) {
    $(data.files).each(function(idx, file) {
      $scope.$broadcast(eventConstants.EDITOR_APPEND_VALUE, '<img src="' + file.mediumUrl + '"/>');
    });
  });
}