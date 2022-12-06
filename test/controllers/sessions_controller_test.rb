require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get root_path
    assert_response :success
  end

  test "should get create" do
    post sessions_edit_path
    assert_response :success
  end

  test "should get logout" do
    delete sessions_destroy_path
    assert_response :success
  end
end