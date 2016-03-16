window.onload = function () {
    var div = document.getElementById('news_header');
    var txt = document.getElementById('block_summary');

    function setFontSize() {
        var coords = div.getBoundingClientRect();
        var w = coords.right - coords.left;

        if(w > 900 ) {
            div.style.fontSize = '9em';
            txt.style.fontSize = '1.3em';
        }
        else if(w <= 900 && w > 640) {
            div.style.fontSize = '7em';
            txt.style.fontSize = '1.3em';
        }
        else if(w <= 640 && w > 480) {
            div.style.fontSize = '5em';
            txt.style.fontSize = '1.3em';
        }
        else if(w <= 480 && w > 350) {
            div.style.fontSize = '3.5em';
            txt.style.fontSize = '1em';
        }
        else if(w <= 350) {
            div.style.fontSize = '3em';
            txt.style.fontSize = '1em';
        }
    }

    setFontSize();

    window.onresize = function () {
        setFontSize();
    }

}