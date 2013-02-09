function AttachmentController($scope, Attachment) {

	var _ = this;

	function loadAttachements(AttachmentResource, fileType) {
		var attachments = AttachmentResource.query(function() {
			$scope.attachments = attachments;
			$scope.$emit('AttachmentsCountChange', $scope.attachments.length, fileType);
		});
	}

	$scope.init = function(lessonplanId, fileType) {
		_.AttachmentResource = Attachment(lessonplanId, fileType);
		_.fileType = fileType
		loadAttachements(_.AttachmentResource, fileType);
	};

	$scope.remove = function(attachment) {
		if(window.confirm('确定要删除么？')) {
			attachment.$remove(function() {
				loadAttachements(_.AttachmentResource, _.fileType);
			});
		}
	};

	$scope.$on('reload', function() {
		loadAttachements(_.AttachmentResource, _.fileType);
	});
}