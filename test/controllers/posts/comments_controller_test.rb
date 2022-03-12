# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    test 'should create' do
      sign_in(users(:one))

      assert_difference('PostComment.count') do
        post = posts(:one)
        post post_comments_path(post), params: { post_comment: { content: 'content' }, format: 'turbo_stream' }
      end
    end
  end
end
