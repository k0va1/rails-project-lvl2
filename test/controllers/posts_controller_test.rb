require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get posts_path(Post.last)
    assert_response :success
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(Post.last)
    assert_response :success
  end

  test "should get update" do
    #    get posts_update_url
    #    assert_response :success
  end

  test "should get destory" do
    #   get posts_destory_url
    #   assert_response :success
  end
end
