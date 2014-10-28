class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  #before_filter :set_locale
  before_action :set_locale

  include SessionsHelper

  helper_method :home_uri
  helper_method :custom_locale_link

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

  def home_uri
    'http://localhost:3000/'
  end

  def custom_locale_link
    "?locale=#{params[:locale] if params[:locale].present?}"
  end

  private
  def default_url_options(option = {})
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  # def set_locale
  #   if params[:locale].blank?
  #     redirect_to "/?locale=en"
  #   else
  #     I18n.locale = params[:locale]
  #   end
  # end


end
