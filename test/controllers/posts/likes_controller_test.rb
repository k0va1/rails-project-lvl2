# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in(users(:one))
    end

    test 'should get create' do
      assert_difference('PostLike.count') do
        post = posts(:two)
        post post_likes_path(post), params: { post_like: { post_id: post.id }, format: 'turbo_stream' }
      end
    end

    test 'should get destroy' do
      assert_difference('PostLike.count', -1) do
        post = posts(:one)
        like = post_likes(:one)
        delete post_like_path(post, like), params: { format: 'turbo_stream' }
      end
    end
  end
end
