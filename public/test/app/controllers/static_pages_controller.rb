class StaticPagesController < ApplicationController
  def home
    @articles = Article.newest_first
  end

end
