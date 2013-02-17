function HomeworksController($scope){
	$scope.$on('upload', function(obj, status){
		if(status === 'complete'){
			$scope.$broadcast('reload');
		}
	});

  var attachmentsCount = {
    images: 0,
    scratches: 0
  };

  $scope.$on("AttachmentsCountChange", function(event, newAttachmentsCount, fileType) {
    attachmentsCount[fileType] = newAttachmentsCount;
    $scope.attachmentsCount = attachmentsCount.images + attachmentsCount.scratches;
  });
}