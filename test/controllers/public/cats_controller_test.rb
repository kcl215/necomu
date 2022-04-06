require "test_helper"

class Public::CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_cats_show_url
    assert_response :success
  end

  test "should get new" do
    get public_cats_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_cats_edit_url
    assert_response :success
  end
end
