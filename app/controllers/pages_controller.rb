class PagesController < ApplicationController

  layout :determine_layout

  before_action :sign_in, except:  [:show]
  before_action :is_admin, except:  [:show]

  def index
    @pages = Page.sorted_new.paginate(page: params[:page], per_page: 5)
  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first
    if @page.nil?
      redirect_to root_path
    else
      # display the page content using show.html.erb
    end
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to edit_pages_path
    else
      @page_count = Page.count + 1
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
       redirect_to edit_page_path
    else
      @page_count = Page.count
      render 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private
  def page_params
    params.require(:page).permit(:title, :text, :permalink, :short_description, :position, :visible, :attachment, :other_attachment)
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

  def determine_layout
    # case
    #   when (signed_in? && params[:action] == 'new' || signed_in? && params[:action] == 'edit')
    #     "admin"
    #   else
    #     "pages"
    # end
    if signed_in? && params[:action] != 'show'
      "admin"
    else
      "pages"
    end
  end

end
