function AttachmentController($scope, Attachment, $element){
	
	var _ = this;
	_.loadResources = function(){
		$scope.resource = Attachment.get(_.lessonplanId);
		$scope.resource[_.fileType](function(attachments){
			$scope.attachments = attachments;
		});
	};

	$scope.init = function(lessonplanId, fileType){
		_.lessonplanId = lessonplanId;
		_.fileType = fileType;
		_.loadResources();
	};	

	$scope.$on('reload', function(){
		_.loadResources();
	});
}