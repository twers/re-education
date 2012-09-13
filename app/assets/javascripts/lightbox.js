//= require jquery
$.fn.extend({
    lightbox : function(options){
        options = $.extend({},options);

        var overlayTemplate = '<div id="overlay">' + 
                                '<div id="current-image-container">' +
                                '<a id="close-btn" class="btn">X</a>' +
                                '<img id="current-image">' +                                   
                                '</div>' +
                               '</div>';
        
        var overlay = $('#overlay').get(0) || 
        $(overlayTemplate).appendTo('body').get(0);

        var currentImage = $('#current-image', overlay);
        var currentImageContainer = $('#current-image-container', overlay);

        var image = $(this).find('img')

        this.on('click',function(evt){
            $(overlay).fadeIn();

            var src = $(this).find('img').attr('src');
            currentImage.attr('src', src);
            currentImageContainer.css('width', currentImage.width());
        });

        $('#overlay').on('click',function(){
            $(this).fadeOut();
        });

        $('#close-btn').on('click',function(){
            $("#overlay").fadeOut();
        });
    }
});

$(document).ready(function() {
    $(".fancy-picture").lightbox();
});

