class ContactFormMailer < ActionMailer::Base
  default from: "dadubinin@gmail.com"

  def user_contact_forms(contact_form)
    @contact_form = contact_form
    mail(to: contact_form.email, subject: "Hello #{contact_form.name}")
  end

  def admin_contact_forms(contact_form)
    @contact_form = contact_form
    mail(to:"dadubinin@gmail.com", subject: "Mail from #{contact_form.name}")
  end
end
