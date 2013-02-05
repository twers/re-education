angular.module('openClass.directives')
		.directive('scratchGallery', function factory(fancybox) {
			var directive = {
				restrict:'C',
				link:function (scope, element, attrs) {
					scope.$watch('attachments', function (attachments) {
						if (attachments) {
							fancybox(element.find('a'), {
								helpers:{
									overlay : {
										css : {
//                      background: '#000'
										}
									},
									title:{
										type:'inside'
									},
									thumbs:{
										width:50,
										height:50
									}
								}//,
//              nextEffect : 'none',
//              prevEffect : 'none'
							});
						}
					});
				}
			};

			return directive;
		});