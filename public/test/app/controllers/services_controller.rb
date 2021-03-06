class ServicesController < ApplicationController

  layout "pages"

  before_action :sign_in, only: [:new, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :edit, :update, :destroy]


  def index
    @services = Service.paginate(page: params[:page], per_page: 6)
  end

  def show

    @service = Service.where(:permalink => params[:permalink], :visible => true).first
    if @service.nil?
      #redirect_to root_path
    else
      # display the page content using show.html.erb
    end

  end

  def new
    @service = Service.new
    @service_count = Service.count + 1
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to edit_services_path
    else
      @service_count = Service.count + 1
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
    @service_count = Service.count
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      redirect_to edit_services_path
    else
      @service_count = Service.count
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private
  def service_params
    params.require(:service).permit(:title, :text, :permalink, :short_description, :position, :visible, :image)
  end

  # Before filters

  def sign_in
    redirect_to(root_url) unless signed_in?
  end

  def is_admin
    unless current_user.admin?
      redirect_to users_url, notice: "You are not have permission "
    end

  end

end
