angular.module('openClass.directives')
  .directive('searchContainer', function factory() {
    return {
      restrict: 'C',
      link: function(scope, element) {
        element.on('submit', function() {
          var word = element.find('.search').val();
          _gaq.push(['_trackEvent', 'Search', word]);
        });
      }
    };
  });