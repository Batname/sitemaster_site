class ContactFormsController < ApplicationController

  def validate
    contact_forms = ContactForm.new(contact_form_params)
    validator(contact_forms)
    respond_to do |format|
      format.json { render json: @errors }
    end
  end


  def create
    @contact_form = ContactForm.new(contact_form_params)

    @contact_form.save
    respond_to do |format|
    if @contact_form.save
      ContactFormMailer.user_contact_forms(@contact_form).deliver
      ContactFormMailer.admin_contact_forms(@contact_form).deliver
      flash[:success] = 'Email добавлен!'
      format.html { redirect_to root_path}
    else
      format.html {render template: 'static_pages/home'}
    end
    format.js
    end
  end

  private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :subject, :massage, :attachment)
  end

end
