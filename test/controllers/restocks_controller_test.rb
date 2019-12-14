require 'test_helper'

class RestocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restocks_index_url
    assert_response :success
  end

  test "should get new" do
    get restocks_new_url
    assert_response :success
  end

  test "should get create" do
    get restocks_create_url
    assert_response :success
  end

  test "should get update" do
    get restocks_update_url
    assert_response :success
  end

end
