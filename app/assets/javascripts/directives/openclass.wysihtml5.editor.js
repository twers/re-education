angular.module('openClass.directives')
  .directive('wysihtml5', ['$timeout', 'eventConstants', function factory($timeout, eventConstants) {

    var directive = {
      restrict: 'C',
      require: '?ngModel',
      link: function (scope, element, attrs, ngModelCtrl) {

        var editor = new wysihtml5.Editor(element.get(0), {
          parserRules: wysihtml5ParserRules,
          toolbar: element.siblings('.toolbar').get(0),
          stylesheets: '/assets/wysihtml5.editor.inner.css'
        });

        if (ngModelCtrl) {
          editor.on('change', function () {
            ngModelCtrl.$setViewValue(editor.getValue());
          });
        }

        editor.on('load', function () {
          var currentView = editor.currentView;
          var editorBody = currentView.element;

          $(editorBody).css({
            overflow: 'hidden',
            minHeight: '100px'
          });

          function resetHeightHandler() {
            resetEditorHeight(currentView);
          }

          $(editorBody).on('keyup', resetHeightHandler);
          editor.on('change:composer', resetHeightHandler);
          editor.on('blur:composer', resetHeightHandler);
          resetEditorHeight(currentView);
        });

        function resetEditorHeight(currentView) {
          $timeout(function () {
            $(currentView.focusStylesHost)
              .add(currentView.blurStylesHost)
              .add(currentView.iframe)
              .css('height', currentView.element.clientHeight);
          }, 0);
        }

        scope.$on(eventConstants.EDITOR_APPEND_VALUE, function (e, value) {
          editor.setValue(editor.getValue() + value).fire('change');
          resetEditorHeight(editor.currentView);
        });

        scope.$on(eventConstants.EDITOR_APPEND_IMG, function (e, file) {
          var image = new Image(), src = file.src, name = file.name;
          image.onload = function () {
            $('[data-target="' + name + '"]', editor.currentView.element).remove();
            scope.$broadcast(eventConstants.EDITOR_APPEND_VALUE, '<img src="' + src + '"/>');
          };
          image.src = src;
          scope.$broadcast(eventConstants.EDITOR_APPEND_VALUE,
            '<span class="image-loading-placeholder" data-target="' + name + '">正在载入 ' + name + '...</span>');
        });
      }
    };

    return directive;
  }]);