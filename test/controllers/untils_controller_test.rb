require 'test_helper'

class UntilsControllerTest < ActionController::TestCase
  setup do
    @until = untils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:untils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create until" do
    assert_difference('Until.count') do
      post :create, until: { rule_id: @until.rule_id }
    end

    assert_redirected_to until_path(assigns(:until))
  end

  test "should show until" do
    get :show, id: @until
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @until
    assert_response :success
  end

  test "should update until" do
    patch :update, id: @until, until: { rule_id: @until.rule_id }
    assert_redirected_to until_path(assigns(:until))
  end

  test "should destroy until" do
    assert_difference('Until.count', -1) do
      delete :destroy, id: @until
    end

    assert_redirected_to untils_path
  end
end
