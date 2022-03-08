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

      respond_to do |format|
        if @comment.save
          format.turbo_stream
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              @comment, partial: 'posts/comments/form',
                        locals: { post: @post, comment: @comment }
            )
          end
        end
      end
    end

    private

    def permitted_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
