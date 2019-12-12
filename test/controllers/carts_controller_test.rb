require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get carts_edit_url
    assert_response :success
  end

  test "should get update" do
    get carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_destroy_url
    assert_response :success
  end

end
