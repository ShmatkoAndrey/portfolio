@skillclick = (skill) ->
  $('#skills_list').find('li').each (i, e) ->
    e.className = ''
    return
  $('#li_skill_' + skill)[0].className += 'active'
  $('#all_skills').find('.skill_show_block').each (i, e) ->
    e.style.display = 'none'
    return
  $('#skill_' + skill)[0].style.display = 'block'
  if skill == 'googleMap'
    initMap()
  else if skill == 'tinymce'
    tinyMCE.init
      resize: false
      selector: 'textarea.tinymce'
  return

$(document).ready ->
  skillclick 'deviseOmniauth'
  return