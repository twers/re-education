angular.module('openClass.directives')
    .directive('inlineDialogTrigger', function factory(fancybox) {

      var directive = {
        restrict:'C',
        link:function (scope, element, attrs) {
          fancybox(element);
        }
      };

      return directive;
    });