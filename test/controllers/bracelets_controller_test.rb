require 'test_helper'

class BraceletsControllerTest < ActionController::TestCase
  setup do
    @bracelet = bracelets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bracelets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bracelet" do
    assert_difference('Bracelet.count') do
      post :create, bracelet: { color: @bracelet.color, is_shaking: @bracelet.is_shaking, user_id: @bracelet.user_id }
    end

    assert_redirected_to bracelet_path(assigns(:bracelet))
  end

  test "should show bracelet" do
    get :show, id: @bracelet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bracelet
    assert_response :success
  end

  test "should update bracelet" do
    patch :update, id: @bracelet, bracelet: { color: @bracelet.color, is_shaking: @bracelet.is_shaking, user_id: @bracelet.user_id }
    assert_redirected_to bracelet_path(assigns(:bracelet))
  end

  test "should destroy bracelet" do
    assert_difference('Bracelet.count', -1) do
      delete :destroy, id: @bracelet
    end

    assert_redirected_to bracelets_path
  end
end
