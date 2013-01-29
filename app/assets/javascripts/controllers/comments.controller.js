function CommentsController($scope, $element, $resource) {
	var tokenParams = { authenticity_token : $('meta[name="csrf-token"]').attr('content') };

	$scope.init = function(lessonplanId){
		$scope.CommentResources = 
			$resource(
				'/lessonplans/:lessonplanId/comments/:commentId',
				{ 
					lessonplanId : lessonplanId, 
					commentId : '@id' 
				}, {
					commit : {
						method : 'POST',
						params : tokenParams
					},
					remove : {
						method : 'DELETE',
						params : tokenParams
					}
				});

		$scope.CommentResources.query(function(comments){
			$scope.comments = comments;
		});

		$element.find('form').submit(function(){ return false; });
	};

	$scope.submitForm = function(){
        if(is_empty_comment()){
            alert("请不要提交空的评论。");
            return;
        }
		$scope.CommentResources.commit({
			content : $scope.new_comment_content
		}, function(data){
			if(data.status === 'duplicate') {
				alert("请不要输入重复的评论。");
				return;
			}
            if(data.status === 'empty') {
                alert("请不要提交空的评论。");
				return;
			}
			$scope.comments.push(data);
			$scope.new_comment_content = '';
		});
	};

	$scope.formatDateTime = function(isoDateString){
		var date = new Date(isoDateString);
		var str = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		str += ' ';
		str += date.getHours() + ':' + date.getMinutes();
		return str;
	};

	$scope.deleteComment = function(index) {
		if(window.confirm('确定要删除么？')){
			$scope.CommentResources.remove({ commentId : $scope.comments[index].id }, function(json){
				if(json.ret){
					$scope.comments.splice(index, 1);
				}else{
					alert("删除失败")
				}
			});
		}
	};

	$scope.getName = function(user){
		return user.alternative_name;
	};

	$scope.getUrl = function(user){
		return '/publishers/' + user.id;
	};

	$scope.getAvatar = function(user){
		return user.avatar.url || '/assets/avatar.png';
	};

    function is_empty_comment(){
        if($scope.new_comment_content === undefined || $.trim($scope.new_comment_content).length == 0){
            return true;
        }
        return false;
    }
}