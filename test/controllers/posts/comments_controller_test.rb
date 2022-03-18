# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    test 'should create' do
      sign_in(users(:one))

      new_comment_params = { content: 'content' }
      post = posts(:one)
      post post_comments_path(post), params: { post_comment: new_comment_params, format: 'turbo_stream' }

      assert post.comments.exists?(new_comment_params)
    end
  end
end
