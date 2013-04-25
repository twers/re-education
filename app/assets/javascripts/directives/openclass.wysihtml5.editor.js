angular.module('openClass.directives')
  .directive('wysihtml5', ['$timeout', function factory($timeout) {

    var directive = {
      restrict: 'C',
      require: '?ngModel',
      link: function (scope, element, attrs, ngModelCtrl) {

        scope.editor = new wysihtml5.Editor(element.get(0), {
          parserRules: wysihtml5ParserRules,
          toolbar: element.siblings('.toolbar').get(0)
        });

        if(ngModelCtrl) {
          scope.editor.on('change', function () {
            ngModelCtrl.$setViewValue($(scope.editor.textareaElement).val());
          });
        }

        scope.editor.on('load', function () {
          var currentView = scope.editor.currentView;
          var editorBody = currentView.element;

          $(editorBody).css({
            overflow : 'hidden',
            minHeight : '100px'
          });

          function resetHeightHandler () {
            resetEditorHeight(currentView);
          }

          $(editorBody).on('keyup', resetHeightHandler);
          scope.editor.on('change:composer', resetHeightHandler);
          scope.editor.on('blur:composer', resetHeightHandler);
          resetEditorHeight(currentView);
        });

        function resetEditorHeight (currentView) {
          $timeout(function () {
            $(currentView.focusStylesHost)
              .add(currentView.blurStylesHost)
              .add(currentView.iframe)
              .css('height', currentView.element.clientHeight);
          }, 0);
        }
      }
    };

    return directive;
  }]);