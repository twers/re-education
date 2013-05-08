angular.module('openClass.modules')
  .factory('eventConstants', function () {
    var constants = {
      FILE_UPLOAD_DONE: 'fileUploadDone',
      EDITOR_APPEND_VALUE: 'editorAppendValue'
    };

    return constants;
  });