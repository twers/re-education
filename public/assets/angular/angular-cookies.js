/**
 * @license AngularJS v1.0.0rc12
 * (c) 2010-2012 Google, Inc. http://angularjs.org
 * License: MIT
 */
(function(e,t,n){"use strict";t.module("ngCookies",["ng"]).factory("$cookies",["$rootScope","$browser",function(e,r){function l(){var e,o,u,a;for(e in s)f(i[e])&&r.cookies(e,n);for(e in i)o=i[e],t.isString(o)?o!==s[e]&&(r.cookies(e,o),a=!0):t.isDefined(s[e])?i[e]=s[e]:delete i[e];if(a){a=!1,u=r.cookies();for(e in i)i[e]!==u[e]&&(f(u[e])?delete i[e]:i[e]=u[e],a=!0)}}var i={},s={},o,u=!1,a=t.copy,f=t.isUndefined;return r.addPollFn(function(){var t=r.cookies();o!=t&&(o=t,a(t,s),a(t,i),u&&e.$apply())})(),u=!0,e.$watch(l),i}]).factory("$cookieStore",["$cookies",function(e){return{get:function(n){return t.fromJson(e[n])},put:function(n,r){e[n]=t.toJson(r)},remove:function(t){delete e[t]}}}])})(window,window.angular);