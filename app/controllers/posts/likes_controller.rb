# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @post_like = current_user.post_likes.find_or_create_by!(post: @post)
    end

    def destroy
      @post_like = PostLike.find(params[:id])
      @post = @post_like.post
      @post_like.destroy!
    end
  end
end
