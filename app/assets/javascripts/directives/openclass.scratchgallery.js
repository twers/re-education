angular.module('openClass.directives')
		.directive('scratchGallery', function factory(fancybox) {
			var directive = {
				restrict:'C',
				link:function (scope, element, attrs) {
					scope.$watch('attachments', function (attachments) {
						if (attachments) {
							fancybox(element.find('a'), {
								helpers:{
									title:{
										type:'inside'
									},
									thumbs:{
										width:50,
										height:50
									}
								}
							});
						}
					});
				}
			};

			return directive;
		});