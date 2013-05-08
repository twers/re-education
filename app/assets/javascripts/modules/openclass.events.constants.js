angular.module('openClass.modules')
  .factory('eventConstants', function () {
    var constants = {
      FILE_UPLOAD_DONE: 'fileUploadDone',
      FILE_UPLOAD_PROGRESS_ALL: 'fileUploadProgressAll',
      EDITOR_APPEND_VALUE: 'editorAppendValue',
      EDITOR_APPEND_IMG: 'editorAppendImage'
    };

    return constants;
  });