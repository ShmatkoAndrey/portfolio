$(function() {
    var mediaDropzone;
    mediaDropzone = new Dropzone("#media-dropzone");
    return mediaDropzone.on("success", function(file, responseText) {
        appendContent(responseText.file.url, responseText.id);

        var _this = this;
        setTimeout(function(){
            _this.removeAllFiles();
        },3000);

    });
});

var appendContent = function(imageUrl, mediaId) {
    $("#media-contents").prepend('<div class="thumbnail" style="border: 1px solid red;"><img src="' + imageUrl + '"/></div>');
};