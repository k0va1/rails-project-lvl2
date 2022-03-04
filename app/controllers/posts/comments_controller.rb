# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[index]

    def index
      @post = Post.find(params[:post_id])
      @comments = @post.post_comments
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.post_comments.new(user: current_user, **permitted_params)

      if @comment.save
        respond_to do |format|
          format.turbo_stream
        end
      end
    end

    private

    def permitted_params
      params.require(:post_comment).permit(:content)
    end
  end
end
