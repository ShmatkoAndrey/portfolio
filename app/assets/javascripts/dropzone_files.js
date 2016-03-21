Dropzone.autoDiscover = false;

if($('#media-dropzone')){
    $(function() {
        var mediaDropzone;
        mediaDropzone = new Dropzone("#media-dropzone");
        return mediaDropzone.on("success", function(file, responseText) {
            appendContent(responseText.file.url, responseText.id);
            var _this = this;
            setTimeout(function(){
                _this.removeAllFiles();
            },5000);
        });
    });

    var appendContent = function(imageUrl, mediaId) {
        $("#media-contents").prepend('<div class="thumbnail" style="border: 1px solid red;" onClick="showImage(\''+imageUrl+'\')">' +
            '<img src="' + imageUrl + '"/></div>');
    };
}
function showImage(url){
    var code = '<img src="' + url + '" />';
    $('#image_show').html(code);
}