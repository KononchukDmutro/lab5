class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts (Сторінка з усіма постами)
  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/1 (Сторінка одного поста)
  def show
  end

  # GET /posts/new (Сторінка створення)
  def new
    @post = Post.new
  end

  # GET /posts/1/edit (Сторінка редагування)
  def edit
  end

  # POST /posts (Обробка збереження)
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 (Обробка оновлення)
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  # DELETE /posts/1 (Видалення)
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end