require 'test_helper'

class RulesControllerTest < ActionController::TestCase
  setup do
    @rule = rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rule" do
    assert_difference('Rule.count') do
      post :create, rule: { action_id: @rule.action_id, bracelet_id: @rule.bracelet_id, event_id: @rule.event_id, until_id: @rule.until_id }
    end

    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should show rule" do
    get :show, id: @rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rule
    assert_response :success
  end

  test "should update rule" do
    patch :update, id: @rule, rule: { action_id: @rule.action_id, bracelet_id: @rule.bracelet_id, event_id: @rule.event_id, until_id: @rule.until_id }
    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should destroy rule" do
    assert_difference('Rule.count', -1) do
      delete :destroy, id: @rule
    end

    assert_redirected_to rules_path
  end
end
