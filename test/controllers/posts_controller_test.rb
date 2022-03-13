# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get show' do
    get posts_path(Post.last)
    assert_response :success
  end

  test 'should get new' do
    sign_in(users(:one))

    get new_post_path
    assert_response :success
  end

  test 'should get edit' do
    sign_in(users(:one))

    get edit_post_path(Post.last)
    assert_response :success
  end
end
