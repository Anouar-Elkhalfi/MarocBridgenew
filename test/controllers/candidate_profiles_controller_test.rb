require "test_helper"

class CandidateProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get candidate_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get candidate_profiles_create_url
    assert_response :success
  end

  test "should get show" do
    get candidate_profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get candidate_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get candidate_profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get candidate_profiles_destroy_url
    assert_response :success
  end

  test "should get index" do
    get candidate_profiles_index_url
    assert_response :success
  end
end
