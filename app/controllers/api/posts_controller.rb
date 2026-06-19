class Api::PostsController < ApplicationController
  # Вимикаємо перевірку токена безпеки для простоти нашого API
  skip_before_action :verify_authenticity_token

  def index
    # Віддаємо всі пости, найновіші зверху
    render json: Post.order(created_at: :desc)
  end

  def create
    post = Post.create(post_params)
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :content)
  end
end