class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  before_filter :set_locale


  def validator(object)
    object.valid?
    model = object.class.name.underscore.to_sym
    field = params[model].first[0]
    @errors = object.errors[field]

    if @errors.empty?
      @errors = true
    else
      name = t("activerecord.attributes.#{model}.#{field}")
      @errors.map! { |e| "#{name} #{e}" }
    end
  end


  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(option = {})
    {locale: I18n.locale}
  end
end
