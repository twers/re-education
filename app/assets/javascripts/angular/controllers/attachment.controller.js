function AttachmentController($scope, AttachmentResource) {

	var Attachment;
	var type;

	function loadAttachements(Attachment, type) {
		Attachment.query(function(attachments) {
			$scope.attachments = attachments;
			$scope.$emit('AttachmentsCountChange', $scope.attachments.length, type);
		});
	}

	$scope.init = function(lessonplanId, fileType) {
		Attachment = AttachmentResource(lessonplanId, fileType);
		type = fileType;
		loadAttachements(Attachment, type);
	};

	$scope.remove = function(index) {
		if(window.confirm('确定要删除么？')) {
			$scope.attachments[index].$remove(function() {
				$scope.attachments.splice(index, 1);
        console.log($scope.attachments.length);
				$scope.$emit('AttachmentsCountChange', $scope.attachments.length, type);
			});
		}
	};

	$scope.$on('reload', function() {
		loadAttachements(Attachment, type);
	});
}