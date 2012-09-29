function CachedTasksController($scope, Task){

	$scope.cachedTasks = [];

	$scope.init = function(lessonplanId){
		$scope.resource = Task.get(lessonplanId);
		$scope.resource.query(function(tasks){
			$scope.cachedTasks = tasks;
		});
	};

	$scope.addTask = function(){
		$scope.cachedTasks.push({
			title : $scope.currentTaskTitle,
			content : $scope.currentTaskContent
		});

		$scope.currentTaskTitle = $scope.currentTaskContent = '';
	};

	$scope.deleteTask = function(index) {
		$scope.cachedTasks.splice(index, 1);
	};

  $scope.newTask = function(){
    $(".task-adding-form.template").clone().removeClass('template').appendTo($('.task-adding-form.template'));
  };

}