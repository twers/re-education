angular.module('openClass.directives')
  .directive('gallery', function factory(fancybox) {
    var directive = {
      restrict: 'C',
      link: function (scope, element, attrs) {
        scope.$watch('attachments', function (attachments) {
          if (attachments) {
            fancybox(element.find('a'));
          }
        });
      }
    };

    return directive;
  });