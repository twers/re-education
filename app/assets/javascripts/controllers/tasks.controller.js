function TasksController($scope, $element) {
	
	$scope.tasks = [];

	var addTaskForm = $element.find('#add-task-form');
	addTaskForm.ajaxForm($scope.submitForm);

	$scope.submitForm = function(){
		console.log(arguments);
	};
}