require 'test_helper'

class Student::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'profile controller should return success' do
    toms_token = create_token_for(users(:tom_student))
    get new_student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, as: :json
    assert_response :success
    assert_equal Profile.new.as_json.merge('user_id' => users(:tom_student).id), JSON.parse(@response.body)
  end

  test 'get profile will return user profile as json' do
    toms_token = create_token_for(users(:tom_student))
    get student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, as: :json
    assert_response :success
    assert_equal users(:tom_student).profile.as_json, JSON.parse(@response.body)
  end

  test 'update user profile return message' do
    user = users(:tom_student)
    toms_token = create_token_for(user)
    new_profile = { first_name: 'New name', last_name: 'New last name', registration_number: 'TI881212' }
    put student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, params: { profile: new_profile }
    assert_response :success
    assert_equal user.profile.first_name, new_profile[:first_name]
    assert_equal user.profile.last_name, new_profile[:last_name]
    assert_equal user.profile.registration_number, new_profile[:registration_number]
    assert_equal user.profile.family_name, users(:tom_student).profile.reload.family_name
  end
end
