angular.module('openClass.directives')
  .directive('dialog', function factory() {
    var directive = {
      restrict:'C',
      link:function (scope, element, attrs) {
//        $(document.body).append(element);
      }
    };

    return directive;
  });