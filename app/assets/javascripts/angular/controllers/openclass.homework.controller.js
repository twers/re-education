function HomeworksController($scope){
	$scope.$on('upload', function(obj, status){
		if(status === 'complete'){
			$scope.$broadcast('reload');
		}
	});

  var attachmentsCount = {
    image: 0,
    scratch: 0
  }

  $scope.$on("AttachmentsCountChange", function(event, newAttachmentsCount, fileType) {
    attachmentsCount[fileType] = newAttachmentsCount;
    $scope.attachmentsCount = attachmentsCount.image + attachmentsCount.scratch;
  });
}