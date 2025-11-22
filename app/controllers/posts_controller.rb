class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # --- カレンダー表示 ---
  def index
    start_date = params.fetch(:start_date, Date.today).to_date

    @events = current_user.posts
      .where(
        'start_time <= ? AND (end_time >= ? OR end_time IS NULL)',
        start_date.end_of_month.end_of_week,
        start_date.beginning_of_month.beginning_of_week
      )
  end

  # --- 新規作成 ---
  def new
    @post = Post.new
  end

  def create
  post = current_user.posts.new(post_params)
  if post.save
    redirect_to user_path(current_user), notice: "保存しました"
  else
    render :new
  end
end

  # --- 詳細 ---
  def show
  end

  # --- 編集 ---
  def edit
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to user_path(current_user), notice: "更新しました"
    else
      render :edit
    end
  end

  # --- 削除 ---
  def destroy
    @post.destroy
    redirect_to action: :index
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :start_time, :end_time)
  end
end