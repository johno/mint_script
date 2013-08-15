$ ->
  devise.grabUserEmailToSendAsParam()

devise = 
  grabUserEmailToSendAsParam: ->
    $('.grab-email').on('click', ->
      if $('#user_email').val().length
        $(this).attr('href', $(this).attr('href') + "?email=#{ $('#user_email').val() }") )