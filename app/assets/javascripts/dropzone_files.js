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



//$('#myModal').modal({
//    show: true,
//    keyboard: true,
//    backdrop: false
//});
//
//$('#myModal').on('shown.bs.modal', function(e) {
//    var $invoker, code;
//    $('#myInput').focus();
//    $invoker = $(e.relatedTarget);
//    code = '<button aria-label="Close" class="close" data-dismiss="modal" type="button"> <span aria-hidden="true">×</span> </button> <br />';
//    code += '<img src ="' + $invoker[0].src + '"</img>';
//    $('.modal-body').html(code);
//    $('.modal-backdrop').remove();
//
//});
//
//$('#myModal').on('hidden.bs.modal', function() {
//    $('.modal-body').html('');
//});