function TaskController($scope) {
  $scope.init = function() {
    $scope.uploader.bind('fileuploaddone', function (evt, data) {
      $(data.result.files).each(function(idx, file) {
        $scope.editor.setValue($scope.editor.getValue() + '<img src="' + file.url + '"/>');
      });
    });
  };
}