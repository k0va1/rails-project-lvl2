# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:post_comments).find(params[:id])
    @comment = PostComment.new(user: current_user, post: @post)
    @post_like = @post.post_likes.merge(current_user.post_likes).first
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(permitted_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
