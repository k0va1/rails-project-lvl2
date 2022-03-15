# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = PostComment.new(user: current_user, post: @post)
    @post_like = @post.likes.merge(current_user.likes).first
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
