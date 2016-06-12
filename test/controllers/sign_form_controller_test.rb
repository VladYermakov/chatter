require 'test_helper'

class SignFormControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sign_form_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sign_form_destroy_url
    assert_response :success
  end

end
