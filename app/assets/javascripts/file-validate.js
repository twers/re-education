//= require jquery

function is_file_extension_allowed(fld) {
    return /(\.jpg|\.png|\.bmp|\.jpeg|\.gif|\.bmp)$/i.test($(fld).val());
}

function clear_file_input() {
    $('.attachment-field').html($('.attachment-field').html());
}

function validate_file(fld) {
    var check_item  = 
        {
            method:is_file_extension_allowed,
            message:"文件格式必须为：jpg jpeg gif png bmp 其中之一,请重新选择附件。"
        };

        if (!check_item['method'](fld)) {
            alert(check_item['message']);
            clear_file_input();
            fld.focus();
            return false;
        }
    return true;
}