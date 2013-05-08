angular.module('openClass.modules')
  .factory('base64', function(){
    Base64.URLSafeBase64Encode = function(str) {
      var base64 = Base64.encode(str);
      return base64.replace('+', '/').replace('-', '_');
    };

    return Base64;
  });