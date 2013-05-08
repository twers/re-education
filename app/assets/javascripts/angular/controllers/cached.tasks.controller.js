function CachedTasksController($scope, TaskResource) {

  $scope.cachedTasks = [];

  var Task;

  $scope.init = function(lessonplanId) {
    if(lessonplanId){
      Task = TaskResource(lessonplanId);
      $scope.cachedTasks = Task.query();
    }

    if($scope.cachedTasks.length == 0) {
      $scope.addTask();
    }
  };

  $scope.addTask = function() {
    $scope.cachedTasks.push({ title: '', content: '' });
  };

  $scope.deleteTask = function(index) {
    if(window.confirm('确定要删除么？')) {

//      TODO: this line has bug with wysihtml5s
//      $scope.cachedTasks.splice(index, 1);

      var newCachedTasks = [];
      $.each($scope.cachedTasks, function (idx, item) {
        if(index != idx) {
          newCachedTasks.push({ title: item.title, content: item.content });
        }
      });

      $scope.cachedTasks = newCachedTasks;
    }
  };
}
