$ ->
  sessy_form.enable()

sessy_form = 
  hideSubmitButton: ->
    $('.sessy_form input:submit').hide()

  bindToFormEvents: ->
    $('#password').keyup ->
      sessy_form.checkSubmitVisibility()
    $('#email').keyup ->
      sessy_form.checkSubmitVisibility()
      
  checkSubmitVisibility: ->
    if $('#password').val().length and $('#email').val().length
      $('.sessy_form input:submit').fadeIn()
    else
      $('.sessy_form input:submit').fadeOut()

  enable: ->
    sessy_form.hideSubmitButton()
    sessy_form.bindToFormEvents()