require 'test_helper'

class SongRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get song_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get song_requests_show_url
    assert_response :success
  end

end
