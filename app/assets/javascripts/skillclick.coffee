@skillclick = (skill) ->
  $('#skills_list li').removeClass 'active'
  $('#li_skill_' + skill).addClass 'active'
  $('#all_skills > div').hide()
  $('#skill_' + skill).show()

  if skill == 'googleMap'
    initMap()
  else if skill == 'dropzone'
    tabsDropzone('top');
  else if skill == 'tinymce'
    tinyMCE.init
      resize: false
      selector: 'textarea.tinymce'

$(document).ready ->
  skillclick 'deviseOmniauth'