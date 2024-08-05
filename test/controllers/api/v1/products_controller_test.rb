require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get api_v1_products_search_url
    assert_response :success
  end
end
