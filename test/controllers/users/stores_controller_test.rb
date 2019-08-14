require 'test_helper'

class Users::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get users_stores_show_url
    assert_response :success
  end

  test "should get new" do
    get users_stores_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_stores_edit_url
    assert_response :success
  end

end
