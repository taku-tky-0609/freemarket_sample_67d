require 'test_helper'

class ItemsCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get ind" do
    get items_comments_ind_url
    assert_response :success
  end

end
