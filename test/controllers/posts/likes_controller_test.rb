# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in(users(:one))
    end

    test 'should get create' do
      post = posts(:two)
      new_post_like_params = { post_id: post.id }
      post post_likes_path(post), params: { post_like: new_post_like_params, format: 'turbo_stream' }

      assert post.likes.exists?(new_post_like_params)
    end

    test 'should get destroy' do
      post = posts(:one)
      like = post_likes(:one)
      delete post_like_path(post, like), params: { format: 'turbo_stream' }

      assert_not post.likes.exists?(like.id)
    end
  end
end
