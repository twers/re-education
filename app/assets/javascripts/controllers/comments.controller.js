function CommentsController($scope, $element, CommentResource) {
	var CommentResources;

	$scope.init = function(lessonplanId) {
		Comment = CommentResource(lessonplanId);

		Comment.query(function(comments) {
			$scope.comments = comments;
		});

		$element.find('form').submit(function() {
			return false;
		});
	};

	$scope.submitForm = function() {
		if(is_empty_comment()) {
			alert("请不要提交空的评论。");
			return;
		}
		var comment = new Comment({
			content: $scope.new_comment_content
		});
		comment.$save(function(data) {
			if(data.status === 'duplicate') {
				alert("请不要输入重复的评论。");
				return;
			}
			if(data.status === 'empty') {
				alert("请不要提交空的评论。");
				return;
			}
			$scope.comments.push(data);
			$scope.$emit('CommentsCountChange', $scope.comments.length);
			$scope.new_comment_content = '';
		});
	};

	$scope.formatDateTime = function(isoDateString) {
		var date = new Date(isoDateString);
		var str = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		str += ' ';
		str += date.getHours() + ':' + date.getMinutes();
		return str;
	};

	$scope.remove = function(index) {
		if(window.confirm('确定要删除么？')) {
			$scope.comments[index].$remove(function(json) {
				if(json.ret) {
					$scope.comments.splice(index, 1);
					$scope.$emit('CommentsCountChange', $scope.comments.length);
				} else {
					alert("删除失败");
				}
			});
		}
	};

	$scope.getName = function(user) {
		return user.alternative_name;
	};

	$scope.getUrl = function(user) {
		return '/publishers/' + user.id;
	};

	$scope.getAvatar = function(user) {
		return user.avatar.url || '/assets/avatar.png';
	};

	function is_empty_comment() {
		if($scope.new_comment_content === undefined || $.trim($scope.new_comment_content).length == 0) {
			return true;
		}
		return false;
	}
}