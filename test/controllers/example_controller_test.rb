require "test_helper"

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    # user = User.find_by(email: "test")
    # user.authenticate("test")
    get example_input_path
    assert_response :success
  end

  test "should get output" do
    # sessions_edit_path(email: "test", password: "test")
    get example_show_path(myParam: 16)
    assert_response :success
  end
end