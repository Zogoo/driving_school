require 'test_helper'

class Student::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'profile controller should return success' do
    toms_token = create_token_for(users(:tom))
    get new_student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, as: :json
    assert_response :success
    assert_equal Profile.new.as_json.merge('user_id' => users(:tom).id), JSON.parse(@response.body)
  end

  test 'get profile will return user profile as json' do
    toms_token = create_token_for(users(:tom))
    get student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, as: :json
    assert_response :success
    assert_equal users(:tom).profile.as_json, JSON.parse(@response.body)
  end

  test 'update user profile return message' do
    user = users(:tom)
    toms_token = create_token_for(user)
    new_profile = { first_name: 'New name', last_name: 'New last name', registration_number: 'TI881212' }
    put student_profile_url, headers: { 'Authorization': "Bearer #{toms_token.token}" }, params: { profile: new_profile }
    assert_response :success
    assert_equal users(:tom).profile.first_name, new_profile[:first_name]
    assert_equal users(:tom).profile.last_name, new_profile[:last_name]
    assert_equal users(:tom).profile.registration_number, new_profile[:registration_number]
    assert_not_nil users(:tom).profile.family_name
  end
end
