function CachedTasksController($scope, Task, $element){

	$scope.cachedTasks = [];

	$scope.init = function(lessonplanId){
		$scope.resource = Task.get(lessonplanId);
		$scope.resource.query(function(tasks){
			$scope.cachedTasks = tasks;
		});
	};

	$scope.addTask = function(){
		$scope.cachedTasks.push({
			title : $scope.currentTaskTitle,
			content : $scope.currentTaskContent
		});

		$scope.currentTaskTitle = $scope.currentTaskContent = '';
	};

	$scope.deleteTask = function(index) {
		if(window.confirm('确定要删除么？')){
			$scope.cachedTasks.splice(index, 1);
		}
	};

	$scope.resetTask = function(index){
		syncTask(index, true);
		toggleStatus(index, false);
	};

	$scope.saveTask = function(index){
		syncTask(index, false);
		toggleStatus(index, false);
	};

  $scope.newTask = function(){
    $(".task-adding-form.template").clone().removeClass('template').appendTo($('.task-adding-form.template'));
  };

  $scope.editTask = function(index){
		toggleStatus(index, true);
  };

  function toggleStatus(index, editStatus){
  	var editableTask = getEditableItem(index);
  	editableTask.find('.static-task-content-' + index).removeClass('hide').addClass(editStatus ? 'hide' : '');
  	editableTask.find('.inline-edit-task-form-' + index).removeClass('hide').addClass(editStatus ? '' : 'hide');

  	editableTask.removeClass('edit').addClass(editStatus ? 'edit' : '');
  }

  function getEditableItem(index){
  	return $element.find('.editable-task-item-' + index);
  }

	function syncTask(index, reset){
		var editableTask = getEditableItem(index);
		var titleElem = editableTask.find('.task-item-title');
		var contentElem = editableTask.find('.task-item-content');

		if(reset){
			titleElem.val($scope.cachedTasks[index].title);
			contentElem.val($scope.cachedTasks[index].content);
		}else{
			$scope.cachedTasks[index].title = titleElem.val();
			$scope.cachedTasks[index].content = contentElem.val();	
		}
	}
}