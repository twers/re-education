angular.module('openClass.modules')
	.factory('fancybox', function(){
		return function(selector, config){
			return angular.element(selector).fancybox(config);
		};
	});