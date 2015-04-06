require 'test_helper'

class BraceletActionsControllerTest < ActionController::TestCase
  setup do
    @bracelet_action = bracelet_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bracelet_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bracelet_action" do
    assert_difference('BraceletAction.count') do
      post :create, bracelet_action: { color: @bracelet_action.color, shake: @bracelet_action.shake }
    end

    assert_redirected_to bracelet_action_path(assigns(:bracelet_action))
  end

  test "should show bracelet_action" do
    get :show, id: @bracelet_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bracelet_action
    assert_response :success
  end

  test "should update bracelet_action" do
    patch :update, id: @bracelet_action, bracelet_action: { color: @bracelet_action.color, shake: @bracelet_action.shake }
    assert_redirected_to bracelet_action_path(assigns(:bracelet_action))
  end

  test "should destroy bracelet_action" do
    assert_difference('BraceletAction.count', -1) do
      delete :destroy, id: @bracelet_action
    end

    assert_redirected_to bracelet_actions_path
  end
end
