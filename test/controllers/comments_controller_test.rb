require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @blogger = bloggers(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, params: { blogger_id: @blogger }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { blogger_id: @blogger }
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { blogger_id: @blogger, comment: @comment.attributes }
    end

    assert_redirected_to blogger_comment_path(@blogger, Comment.last)
  end

  test "should show comment" do
    get :show, params: { blogger_id: @blogger, id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { blogger_id: @blogger, id: @comment }
    assert_response :success
  end

  test "should update comment" do
    put :update, params: { blogger_id: @blogger, id: @comment, comment: @comment.attributes }
    assert_redirected_to blogger_comment_path(@blogger, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { blogger_id: @blogger, id: @comment }
    end

    assert_redirected_to blogger_comments_path(@blogger)
  end
end
