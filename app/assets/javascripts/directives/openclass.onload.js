angular.module('openClass.directives')
  .directive('onLoad', function factory() {
    var directive = {
      restrict: 'A',
      link: function (scope, elem, attrs) {
        scope.$eval(attrs.onLoad);
      }
    }
    return directive;
  });