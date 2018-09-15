class ArticlesController < ApplicationController
  before_action :redirect_to_index, except:[:index,:show]
  def index
    @articles=Article.includes(:user).order('created_at DESC').page(params[:page]).per(5)
    @likes = Like.where(article_id: params[:article_id])
  end

  def new
    @article =Article.new
  end

  def show
    article_set
  end

  def edit
    article_set
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  def destroy
    article_set
    @article.destroy
    redirect_to action: :index
  end

  def update
    article_set
    @article.update(article_params)
    redirect_to action: :index
  end

  private
  def article_params
    params.require(:article).permit(:text,:title).merge(user_id: current_user.id)
  end

  def article_set
    @article=Article.find(params[:id])
  end

  def redirect_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
