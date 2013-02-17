angular.module('openClass.models').
  factory('CommentResource', ['$resource', function ($resource) {
    var authenticity_token = angular.element('meta[name="csrf-token"]').attr('content');

    var CommentResource = function (lessonplanId) {
      return $resource('/lessonplans/:lessonplanId/comments/:commentId', {
        lessonplanId: lessonplanId,
        commentId: '@id'
      }, {
        'save': {
          method: 'POST',
          params: { 'authenticity_token': authenticity_token }
        },
        'remove': {
          method: 'DELETE',
          params: { 'authenticity_token': authenticity_token }
        }
      });
    }
    return CommentResource;
  }]);