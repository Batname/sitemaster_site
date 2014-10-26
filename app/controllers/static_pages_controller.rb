class StaticPagesController < ApplicationController

  helper :all

  def home
    @articles = Article.newest_first
    @last_article = Article.last
    # @budget = ContactFormsHelper.bat
  end



end
