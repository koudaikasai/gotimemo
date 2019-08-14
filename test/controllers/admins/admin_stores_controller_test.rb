require 'test_helper'

class Admins::AdminStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_admin_stores_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_admin_stores_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_admin_stores_edit_url
    assert_response :success
  end

end
