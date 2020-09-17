require 'test_helper'

class Student::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "profile controller should return success" do
    toms_token = create_token_for(users(:tom_student))
    get new_student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, as: :json
    assert_response :success
  end
end
