function CommentsController($scope, $element, $resource) {
	$scope.init = function(lessonplanId){
		$scope.CommentResources = 
			$resource(
				'/lessonplans/:lessonplanId/comments/:commentId',
				{ 
					lessonplanId : lessonplanId, 
					commentId : '@id' 
				});

		$scope.CommentResources.query(function(comments){
			$scope.comments = comments;
		});

		$element.find('form').submit(function(){ return false; });
	};

	$scope.submitForm = function(){
		$scope.CommentResources.save({
			content : $scope.new_comment_content
		}, function(comment){
			$scope.comments.push(comment);
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
}