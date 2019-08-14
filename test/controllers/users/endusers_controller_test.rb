require 'test_helper'

class Users::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_endusers_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_endusers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_endusers_destroy_url
    assert_response :success
  end

end
