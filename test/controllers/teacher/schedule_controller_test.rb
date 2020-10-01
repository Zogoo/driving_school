require 'test_helper'

class Teacher::ScheduleControllerTest < ActionDispatch::IntegrationTest
  test 'teacher should able to retrieve own schedule' do
    user = users(:mad_max)
    max_token = create_token_for(user)
    get teacher_schedule_index_url, headers: { 'Authorization': "Bearer #{max_token.token}" }, as: :json
    assert_response :success
    assert_equal user.teacher.schedules.all.as_json, JSON.parse(@response.body)
  end

  test 'teacher should able to create new schedule' do
    user = users(:mad_max)
    max_token = create_token_for(user)
    new_schedule = {
      teacher_id: user.teacher.id,
      title: 'A class lesson',
      driving_lesson_id: driving_lessons(:max_driving_lesson).id,
      start: Time.current.since(2.week),
      finish: Time.current.since(2.week) + 4.hours,
      step: 60
    }
    assert_changes -> { user.teacher.schedules.count }, from: 1, to: 2 do
      post teacher_schedule_index_url, headers: { 'Authorization': "Bearer #{max_token.token}" }, params: { schedule: new_schedule }
      assert_response :success
    end
  end
end
