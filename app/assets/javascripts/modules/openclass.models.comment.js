angular.module('openClass.models').
factory('CommentResource', ['$resource', function($resource) {
  var CommentResource = function(lessonplanId) {
    return $resource('/lessonplans/:lessonplanId/comments/:commentId', {
      lessonplanId: lessonplanId,
      commentId: '@id'
    });
  }
  return CommentResource;
}]);