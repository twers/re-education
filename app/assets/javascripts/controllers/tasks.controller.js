function TasksController($scope, $element, $resource) {

	$scope.init = function(lessonplanId){
		$scope.Tasks = 
			$resource(
				'/lessonplans/:lessonplanId/tasks/:taskId',
				{ lessonplanId : lessonplanId, taskId : '@id' });

		$scope.Tasks.query(function(tasks){
			$scope.tasks = tasks;
		});

		$element.find('#add-task-form').submit(function(){ return false; });
	};

	$scope.getItemCssClass = function(idx){
		return idx === $scope.tasks.length - 1 ? 'done' : '';
	};

	$scope.submitForm = function(){
		$scope.Tasks.save({
			title : $scope.new_task_title, 
			content : $scope.new_task_content 
		}, function(savedTask){
			$scope.tasks.push(savedTask);
			$scope.new_task_title = $scope.new_task_content = '';
		});
	};
}