class ArticlesController < ApplicationController

  def show
    byebug
    @article = Article.find(params[:id])
  end

  def to_s
    super
    "Title: #{@article.title}, Description: #{@article.description}, Updated at: #{@article.updated_at}"
  end
end
