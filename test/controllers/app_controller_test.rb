require 'test_helper'

class AppControllerTest < ActionController::TestCase
  test "should get getAction" do
    get :getAction
    assert_response :success
  end

end
