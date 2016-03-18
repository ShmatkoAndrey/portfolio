$(function() {
    var mediaDropzone;
    mediaDropzone = new Dropzone("#media-dropzone");
    return mediaDropzone.on("success", function(file, responseText) {
        appendContent(responseText.file.url, responseText.id);
    });
});

var appendContent = function(imageUrl, mediaId) {
    $("#media-contents").prepend('<div class="thumbnail" style="border: 1px solid red;"><img src="' + imageUrl + '"/></div>');
};