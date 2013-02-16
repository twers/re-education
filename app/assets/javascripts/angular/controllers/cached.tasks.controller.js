function CachedTasksController($scope, $element) {

  $scope.cachedTasks = [];
  var editors = {};
  var options = {
    items: ['source', 'bold', 'link', 'insertorderedlist', 'insertunorderedlist', 'image'],
    uploadJson: '/kindeditor/upload?dir=image'
  };

  var addNewSrcElement = $element.find('.simple-editor');

  editors['addNewEditor'] = {
    srcElement: addNewSrcElement,
    editor: KindEditor.create(addNewSrcElement[0], options)
  };

  $scope.init = function() {
  };

  $scope.addTask = function() {
    syncToTextarea('addNewEditor');
    
    $scope.cachedTasks.push({
      title: $scope.currentTaskTitle,
      content: editors['addNewEditor'].srcElement.val()
    })

    $scope.currentTaskTitle = $scope.currentTaskContent = '';
    editors['addNewEditor'].srcElement.val('');
    syncToEditor('addNewEditor');
  };

  $scope.deleteTask = function(index) {
    if(window.confirm('确定要删除么？')) {
      $scope.cachedTasks.splice(index, 1);
    }
  };

  $scope.resetTask = function(index) {
    syncToEditor(index);

    syncTask(index, true);
    toggleStatus(index, false);
  };

  $scope.saveTask = function(index) {
    syncToTextarea(index);

    syncTask(index, false);
    toggleStatus(index, false);
  };

  $scope.newTask = function() {
    $(".task-adding-form.template").clone().removeClass('template').appendTo($('.task-adding-form.template'));
  };

  $scope.editTask = function(index) {
    toggleStatus(index, true);

    if(!editors[index]) {
      var editorElem = getEditableItem(index).find('.simple-editor');

      editors[index] = {
        srcElement: editorElem,
        editor: KindEditor.create(editorElem[0], options)
      };
    }
  };

  function toggleStatus(index, editStatus) {
    var editableTask = getEditableItem(index);

    editableTask.find('.static-task-content-' + index).removeClass('hide').addClass(editStatus ? 'hide' : '');
    editableTask.find('.inline-edit-task-form-' + index).removeClass('hide').addClass(editStatus ? '' : 'hide');

    editableTask.removeClass('edit').addClass(editStatus ? 'edit' : '');
  }

  function getEditableItem(index) {
    return $element.find('.editable-task-item-' + index);
  }

  function syncTask(index, reset) {
    var editableTask = getEditableItem(index);
    var titleElem = editableTask.find('.task-item-title');
    var contentElem = editableTask.find('.task-item-content');

    if(reset) {
      titleElem.val($scope.cachedTasks[index].title);
      contentElem.val($scope.cachedTasks[index].content);
    } else {
      $scope.cachedTasks[index].title = titleElem.val();
      $scope.cachedTasks[index].content = contentElem.val();
    }
  }

  function syncToTextarea(key) {
    editors[key].editor.sync(key);
  }

  function syncToEditor(key) {
    editors[key].editor.html(editors[key].srcElement.val());
  }

}
