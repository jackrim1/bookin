require 'test_helper'

class MessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mess = messes(:one)
  end

  test "should get index" do
    get messes_url
    assert_response :success
  end

  test "should get new" do
    get new_mess_url
    assert_response :success
  end

  test "should create mess" do
    assert_difference('Mess.count') do
      post messes_url, params: { mess: { address: @mess.address, name: @mess.name, postcode: @mess.postcode } }
    end

    assert_redirected_to mess_url(Mess.last)
  end

  test "should show mess" do
    get mess_url(@mess)
    assert_response :success
  end

  test "should get edit" do
    get edit_mess_url(@mess)
    assert_response :success
  end

  test "should update mess" do
    patch mess_url(@mess), params: { mess: { address: @mess.address, name: @mess.name, postcode: @mess.postcode } }
    assert_redirected_to mess_url(@mess)
  end

  test "should destroy mess" do
    assert_difference('Mess.count', -1) do
      delete mess_url(@mess)
    end

    assert_redirected_to messes_url
  end
end
