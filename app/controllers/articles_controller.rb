class ArticlesController < ApplicationController
  before_action :create_action

  def index
    @articles = Article.all
    @users_count = get_users_count
  end

  def show
    @articles = Article.all
    @article = Article.find(params[:id])
    @users_count = get_users_count
  end

  def new
    @articles = Article.all
    @article = Article.new
    @users_count = get_users_count
  end

  def create
    @articles = Article.all
    @article = Article.new(article_params)
    if (@article.save)
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @articles = Article.all
    @article = Article.find(params[:id])
    @users_count = get_users_count
  end

  def update
    @articles = Article.all
    @article = Article.find(params[:id])
    @users_count = get_users_count
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @articles = Article.all
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private def article_params
    params.require(:article).permit(:title, :text, :img)

  end

  private def create_action
    @action = Activity.new({:ip_addr => request.remote_ip})
    @action.save
  end

  private def get_users_count
    previous_time = DateTime.now - 5.minutes
    current_time = DateTime.now
    recently = Activity.where(created_at: (previous_time .. current_time))
            .select(:ip_addr)
            .distinct
            .count
    all = Activity.select(:ip_addr)
              .distinct
              .count
    {:recently => recently, :all => all}
  end
end
