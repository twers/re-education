function CachedTasksController($scope){

	$scope.cachedTasks = [];

	$scope.addTask = function(){
		$scope.cachedTasks.push({
			title : $scope.currentTaskTitle,
			content : $scope.currentTaskContent
		});

		$scope.currentTaskTitle = $scope.currentTaskContent = '';
	};

}