class ContactFormMailer < ActionMailer::Base
  default from: "contact@emaster.pro"

  def user_contact_forms(contact_form)
    @contact_form = contact_form
    mail(to: contact_form.email, subject: "Hello #{contact_form.name}")
  end

  def admin_contact_forms(contact_form)
    @contact_form = contact_form
    mail(to:"contact@emaster.pro", subject: "Mail from #{contact_form.name}")
  end
end
