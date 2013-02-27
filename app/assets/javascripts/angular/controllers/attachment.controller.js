function AttachmentController($scope, AttachmentResource) {

  var Attachment;

  function loadAttachments(Attachment, type) {
    Attachment.query(function(attachments) {
      $scope.attachments = attachments;
      $scope.$emit('AttachmentsCountChange', $scope.attachments.length, type);
    });
  }

  $scope.init = function(lessonplanId, fileType) {
    Attachment = AttachmentResource(lessonplanId, fileType);
    $scope.fileType = fileType;
    loadAttachments(Attachment, $scope.fileType);
  };

  $scope.remove = function(index) {
    if (window.confirm('确定要删除么？')) {
      $scope.attachments[index].$remove(function() {
        _gaq.push(['_trackEvent', 'Attachment', 'Remove', $scope.fileType]);
        $scope.attachments.splice(index, 1);
        $scope.$emit('AttachmentsCountChange', $scope.attachments.length, $scope.fileType);
      });
    }
  };

  $scope.$on('AttachmentAdd', function(obj, fileType) {
    if (fileType === $scope.fileType) {
      _gaq.push(['_trackEvent', 'Attachment', 'Add', $scope.fileType]);
      loadAttachments(Attachment, $scope.fileType);
    }
  });
}