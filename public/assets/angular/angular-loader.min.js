/*
 AngularJS v1.0.0rc12
 (c) 2010-2012 Google, Inc. http://angularjs.org
 License: MIT
*/
(function(e){"use strict";function t(e,t,n){return e[t]||(e[t]=n())}return t(t(e,"angular",Object),"module",function(){var e={};return function(n,r,i){return r&&e.hasOwnProperty(n)&&(e[n]=null),t(e,n,function(){function e(e,n,r){return function(){return t[r||"push"]([e,n,arguments]),u}}if(!r)throw Error("No module: "+n);var t=[],s=[],o=e("$injector","invoke"),u={_invokeQueue:t,_runBlocks:s,requires:r,name:n,provider:e("$provide","provider"),factory:e("$provide","factory"),service:e("$provide","service"),value:e("$provide","value"),constant:e("$provide","constant","unshift"),filter:e("$filterProvider","register"),controller:e("$controllerProvider","register"),directive:e("$compileProvider","directive"),config:o,run:function(e){return s.push(e),this}};return i&&o(i),u})}})})(window);