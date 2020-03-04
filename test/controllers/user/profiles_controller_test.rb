require 'test_helper'

class User::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get my_account" do
    get user_profiles_my_account_url
    assert_response :success
  end

end
