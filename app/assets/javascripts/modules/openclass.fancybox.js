angular.module('openClass.modules')
	.factory('fancybox', function(){
		return function(selector, config){
			return $(selector).fancybox(config);
		};
	});