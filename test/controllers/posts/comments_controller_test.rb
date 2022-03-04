# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get posts_comments_index_url
      assert_response :success
    end

    test 'should get new' do
      get posts_comments_new_url
      assert_response :success
    end

    test 'should get create' do
      get posts_comments_create_url
      assert_response :success
    end
  end
end
