class ProjectsController < ApplicationController

  layout :determine_layout

  before_action :sign_in, except:  [:show]
  before_action :is_admin, except:  [:show]


  def index
    @projects = Project.paginate(page: params[:page], per_page: 6)
  end

  def show
    @project = Project.where(:permalink => params[:permalink], :visible => true).first
    if @project.nil?
      redirect_to root_path
    else
      # display the page content using show.html.erb
    end
  end

  def new
    @project = Project.new
    @project_count = Project.count + 1
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to edit_projects_path
    else
      @project_count = Project.count + 1
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project_count = Project.count
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to edit_projects_path
    else
      @project_count = Project.count
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :text, :permalink, :short_description, :position, :visible, :image)
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
    if signed_in? && params[:action] != 'show'
      "admin"
    else
      "pages"
    end
  end

end
