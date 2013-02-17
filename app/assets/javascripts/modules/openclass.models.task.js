angular.module('openClass.models').
  factory('TaskResource', ['$resource', function ($resource) {
    var TaskResource = function (lessonplanId) {
      return $resource('/lessonplans/:lessonplanId/tasks/:taskId', {
        lessonplanId: lessonplanId,
        taskId: '@id'
      });
    }

    return TaskResource;
  }]);