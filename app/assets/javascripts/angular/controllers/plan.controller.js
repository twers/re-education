function PlanController($scope) {
  $scope.$on("CommentsCountChange", function(event, newCount) {
    $scope.commentsCount = newCount;
  });
}