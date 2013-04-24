function CachedTasksController($scope, TaskResource) {

  $scope.cachedTasks = [];

  var Task;

  $scope.init = function(lessonplanId) {
    Task = TaskResource(lessonplanId);
    $scope.cachedTasks = Task.query();
  };

  $scope.addTask = function() {
    $scope.cachedTasks.push({
      title: $scope.currentTaskTitle,
      content: $scope.currentTaskContent
    });

    $scope.currentTaskTitle = $scope.currentTaskContent = '';
    var editor = $('.new-step .wysihtml5').scope().editor;
    if(editor) {
      editor.clear();
    }
  };

  $scope.deleteTask = function(index) {
    if(window.confirm('确定要删除么？')) {
      $scope.cachedTasks.splice(index, 1);
    }
  };
}
