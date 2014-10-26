#jQuery ->
#  validate_url = 'contact_forms/validate'
#
#  $('#new_contact_form, [id^=edit_contact_form_]').validate(
##    debug: true
#    rules:
#      'contact_form[name]':
#        required: true
#        remote:
#          url: validate_url
#          type: 'post'
#      'contact_form[email]':
#        required: true
#        remote:
#          url: validate_url
#          type: 'post'
#      'contact_form[subject]':
#        required: true
#        remote:
#          url: validate_url
#          type: 'post'
#      'contact_form[massage]':
#        required: true
#        remote:
#          url: validate_url
#          type: 'post'
#  )
#
