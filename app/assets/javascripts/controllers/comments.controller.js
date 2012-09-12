function CommentsController($scope, $element, $resource) {

	$scope.init = function(lessonplanId){
		$scope.CommentResources = 
			$resource(
				'/lessonplans/:lessonplanId/comments/:commentId',
				{ lessonplanId : lessonplanId, commentId : '@id' });

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
}