# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :set_post

    def create
      @comment = @post.comments.new(user: current_user, **permitted_params)

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
        format.html { redirect_to(post_path(@post)) }
      end
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def permitted_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
