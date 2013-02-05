function AttachmentController($scope, Attachment, $element){
	
	var _ = this;
	_.loadResources = function(){
		$scope.resource = Attachment.get(_.lessonplanId);
		$scope.resource.query(function(attachments){
			$scope.attachments = attachments;
		});
	};

	$scope.init = function(lessonplanId){
		_.lessonplanId = lessonplanId;
		_.loadResources();
	};	

	$scope.$on('reload', function(){
		_.loadResources();
	});
}