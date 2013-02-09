angular.module('openClass.models')
.factory('Attachment', ['$resource', function ($resource) {
	var Attachment = function(lessonplanId, fileType) {
		return $resource('/lessonplans/:lessonplanId/attachments/:attachmentId', {
			lessonplanId: lessonplanId,
			attachmentId: '@id'
		}, { 
      'query': {
        method: 'GET',
        params: { 'file_type':  fileType },
        isArray: true
      }
    });
	}
	return Attachment;
}]);