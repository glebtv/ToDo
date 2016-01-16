init = ->
  $('.multiselect').multiselect()
  $form = $('.multiform')
  $checkbox = $('.multiform-checkbox')

  unless $checkbox.is(':checked')
    $form.hide()
  $checkbox.on 'click', ->
    $form.slideToggle()



$(document).on('page:change', init)
