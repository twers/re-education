function AttachmentController($scope, Attachment, $element){
	
	var _ = this;
	_.loadResources = function(){
		$scope.resource = Attachment.get(_.lessonplanId);
		$scope.resource[_.fileType](function(attachments){
			$scope.attachments = attachments;
			$scope.$emit('AttachmentsCountChange', $scope.attachments.length, _.fileType);
		});
	};

	$scope.init = function(lessonplanId, fileType){
		_.lessonplanId = lessonplanId;
		_.fileType = fileType;
		_.loadResources(fileType);
	};	

	$scope.$on('reload', function(){
		_.loadResources();
	});
}