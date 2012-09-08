function CachedTasksController($scope){

	$scope.cachedTasks = [];

	$scope.addTask = function(){
		$scope.cachedTasks.push({
			title : $scope.currentTaskTitle,
			content : $scope.currentTaskContent
		});

		$scope.currentTaskTitle = $scope.currentTaskContent = '';
	};


  $scope.newTask = function(){
    $(".task-adding-form.template").clone().removeClass('template').appendTo($('.task-adding-form.template'));
  };

}