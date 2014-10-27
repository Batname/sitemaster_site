class ArticlesController < ApplicationController


  layout :determine_layout

  before_action :sign_in, only: [:new, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :edit, :update, :destroy]


  def index
    @articles = Article.sorted_new.paginate(page: params[:page], per_page: 5)
  end

  def show
    @article = Article.where(:permalink => params[:permalink], :visible => true).first
    if @article.nil?
      redirect_to root_path
    else
      # display the page content using show.html.erb
    end
  end

  def new
    @article = Article.new
    @article_count = Article.count + 1
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to edit_news_path
    else
      @article_count = Article.count + 1
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    @article_count = Article.count
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to edit_news_path
    else
      @article_count = Article.count
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :permalink, :short_description, :position, :visible, :image, :attachment)
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
    case
      when (signed_in? && params[:action] == 'new' || signed_in? && params[:action] == 'edit')
        "admin"
      else
        "pages"
    end
    # if signed_in? && params[:action] != 'show'
    #   "admin"
    # else
    #   "pages"
    # end
  end

end
