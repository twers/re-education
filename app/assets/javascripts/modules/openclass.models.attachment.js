angular.module('openClass.models')
		.factory('Attachment', ['$resource', function ($resource) {
	var Attachment = {
		get:function (lessonplanId, attachmentId) {
			var resource = $resource(
					'/lessonplans/:lessonplanId/attachments/:attachmentId',
					{
						lessonplanId:lessonplanId,
						attachmentId:attachmentId || '@id'
					}, {
						images:{ method:'GET', params:{ 'file_type':'image' }, isArray:true},
						scratches:{ method:'GET', params:{ 'file_type':'scratch' }, isArray:true}
					});

			return resource;
		}
	};

	return Attachment;
}])