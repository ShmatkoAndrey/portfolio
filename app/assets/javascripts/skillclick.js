function skillclick(skill) {
    $('#skills_list').find('li').each(function(i, e){e.className = ''});
    $('#li_skill_' + skill)[0].className += 'active';
    $('#all_skills').find('.skill_show_block').each(function(i, e){e.style.display = 'none'});
    $('#skill_' + skill)[0].style.display = 'block'
}