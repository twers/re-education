function TasksController($scope, $element, TaskResource) {

  var Task;

  $scope.init = function(lessonplanId) {
    Task = TaskResource(lessonplanId);

    Task.query(function(tasks) {
      $scope.tasks = tasks;
    });

    $element.find('#add-task-form').submit(function() {
      return false;
    });
  };

  $scope.getItemCssClass = function(idx) {
    return idx === $scope.tasks.length - 1 ? 'done' : '';
  };

  $scope.submitForm = function() {
    var task = new Task({
    title: $scope.new_task_title,
    content: $scope.new_task_content
  });
  
  task.$save(function(savedTask) {
    $scope.tasks.push(savedTask);
    $scope.new_task_title = $scope.new_task_content = '';
  });
 };
}