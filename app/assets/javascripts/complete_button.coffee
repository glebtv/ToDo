init = ->
  $('.not-complete').on 'click', ->
    $t = $(this)
    id = $t.data('id')
    $.ajax
      url: '/tasks/' + id
      method: 'PATCH'
      data:
        task:
          complete: 1
      success: (data) ->
        $t.removeClass('glyphicon-remove not-complete').addClass('glyphicon-ok complete')
      error: ->
        console.log 'e'

  $('.complete').on 'click', ->
    $t = $(this)
    id = $t.data('id')
    $.ajax
      url: '/tasks/' + id
      method: 'PATCH'
      data:
        task:
          complete: 0
      success:  (data)->
        $t.removeClass('glyphicon-ok complete').addClass('glyphicon-remove not-complete')
      error: (data)->
        console.log 'e'
        console.log data

  # $('.complete').on 'click', ->
  #
$(document).on('page:change', init)
