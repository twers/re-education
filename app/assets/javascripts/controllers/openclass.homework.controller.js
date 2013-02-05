function HomeworksController($scope){
	$scope.$on('upload', function(obj, status){
		if(status === 'complete'){
			$scope.$broadcast('reload');
		}
	});
}