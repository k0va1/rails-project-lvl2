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

  test 'should create' do
    sign_in(users(:one))

    assert_difference('Post.count') do
      post posts_path, params: { post: { title: 'title', body: 'body', post_category_id: PostCategory.last.id } }
    end

    assert_response :redirect
  end
end
