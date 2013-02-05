angular.module('openClass.models')
	.factory('Attachment', ['$resource', function($resource){
		var Attachment = {
			get : function(lessonplanId, attachmentId) {
					return $resource('/lessonplans/:lessonplanId/attachments/:attachmentId', { lessonplanId : lessonplanId, attachmentId : attachmentId || '@id' });
				}
			};

		return Attachment;
	}])