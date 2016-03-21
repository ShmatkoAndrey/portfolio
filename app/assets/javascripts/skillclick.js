function skillclick(skill) {
    $('#skills_list').find('li').each(function(i, e){e.className = ''});
    $('#li_skill_' + skill)[0].className += 'active';
    $('#all_skills').find('.skill_show_block').each(function(i, e){e.style.display = 'none'});
    $('#skill_' + skill)[0].style.display = 'block'

    if(skill == 'googleMap') { initMap();}
    else if(skill == 'tinymce') {
        tinyMCE.init({
            resize: false,
            //plugins: [
            //    "advlist autolink lists link image charmap print preview anchor",
            //    "searchreplace visualblocks code fullscreen",
            //    "insertdatetime media table contextmenu paste "
            //],
            selector: 'textarea.tinymce'
        });
    }
}