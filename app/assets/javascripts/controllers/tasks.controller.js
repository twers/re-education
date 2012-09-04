function TasksController($scope, $element, $http) {

	var addTaskForm = $element.find('#add-task-form');
	addTaskForm.ajaxForm($scope.submitForm);

	$scope.submitForm = function(json){
		$scope.tasks.concat([json]);
	};

	$scope.init = function(lessonplanId){
		$scope.Tasks = $resource('/lessonplans/:lessonplanId/tasks/:taskId', 
			{ lessonplanId : lessonplanId, taskId : '@id' });
	};
}