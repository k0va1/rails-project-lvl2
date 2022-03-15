# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @post_like = current_user.likes.find_or_create_by!(post: @post)

      respond_to do |format|
        format.html { redirect_to(post_path(@post)) }
        format.turbo_stream
      end
    end

    def destroy
      @post_like = PostLike.find(params[:id])
      @post = @post_like.post
      @post_like.destroy!

      respond_to do |format|
        format.html { redirect_to(post_path(@post)) }
        format.turbo_stream
      end
    end
  end
end
