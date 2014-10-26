class StaticPagesController < ApplicationController

  helper :all

  def home
    @articles = Article.newest_first
    # @budget = ContactFormsHelper.bat
  end



end
