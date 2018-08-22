require 'test_helper'

class BidingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biding = bidings(:one)
  end

  test "should get index" do
    get bidings_url
    assert_response :success
  end

  test "should get new" do
    get new_biding_url
    assert_response :success
  end

  test "should create biding" do
    assert_difference('Biding.count') do
      post bidings_url, params: { biding: { post_id: @biding.post_id, price: @biding.price, success_bid: @biding.success_bid, user_id: @biding.user_id } }
    end

    assert_redirected_to biding_url(Biding.last)
  end

  test "should show biding" do
    get biding_url(@biding)
    assert_response :success
  end

  test "should get edit" do
    get edit_biding_url(@biding)
    assert_response :success
  end

  test "should update biding" do
    patch biding_url(@biding), params: { biding: { post_id: @biding.post_id, price: @biding.price, success_bid: @biding.success_bid, user_id: @biding.user_id } }
    assert_redirected_to biding_url(@biding)
  end

  test "should destroy biding" do
    assert_difference('Biding.count', -1) do
      delete biding_url(@biding)
    end

    assert_redirected_to bidings_url
  end
end
