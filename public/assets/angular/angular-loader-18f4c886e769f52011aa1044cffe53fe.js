/**
 * @license AngularJS v1.0.0rc12
 * (c) 2010-2012 Google, Inc. http://angularjs.org
 * License: MIT
 */
(function(t){function n(e,t,n){return e[t]||(e[t]=n())}return n(n(t,"angular",Object),"module",function(){var e={};return function(r,i,s){return i&&e.hasOwnProperty(r)&&(e[r]=null),n(e,r,function(){function u(t,n,r){return function(){return e[r||"push"]([t,n,arguments]),o}}if(!i)throw Error("No module: "+r);var e=[],t=[],n=u("$injector","invoke"),o={_invokeQueue:e,_runBlocks:t,requires:i,name:r,provider:u("$provide","provider"),factory:u("$provide","factory"),service:u("$provide","service"),value:u("$provide","value"),constant:u("$provide","constant","unshift"),filter:u("$filterProvider","register"),controller:u("$controllerProvider","register"),directive:u("$compileProvider","directive"),config:n,run:function(e){return t.push(e),this}};return s&&n(s),o})}})})(window),angular.Module;