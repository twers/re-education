angular.module('openClass.models', ['ngResource']).factory('Task', ['$resource', function($resource){
	
	var Task = {
		get : function(lessonplanId, taskId) {
				return $resource('/lessonplans/:lessonplanId/tasks/:taskId', { lessonplanId : lessonplanId, taskId : taskId || '@id' });
			}
		};

	return Task;

}]);

