# frozen_string_literal: true

require 'test_helper'

class StudyPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_preference = study_preferences(:one)
    @deadline = deadlines(:three)
  end

  test 'should get index' do
    get study_preferences_url
    assert_response :success
  end

  test 'should get new' do
    get new_study_preference_url
    assert_response :success
  end

  test 'should create study preference' do
    assert_difference('StudyPreference.count') do
      post study_preferences_url,
          params: { study_preference: { deadline_id: @deadline.id, requiredTime: 3, priority: 3 } }
    end

    assert_redirected_to study_preference_url(StudyPreference.last)
  end

  test 'should show study preference' do
    get study_preference_url(@study_preference)
    assert_response :success
  end

  test 'should get edit' do
    get edit_study_preference_url(@study_preference)
    assert_response :success
  end

  test 'should update study preference' do
    patch study_preference_url(StudyPreference.last),
          params: { study_preference: { deadline: @study_preference.deadline, requiredTime: @study_preference.requiredTime, priority: @study_preference.priority } }
    assert_redirected_to study_preference_url(StudyPreference.last)
  end

  test 'should destroy study preference' do
    assert_difference('StudyPreference.count', -1) do
      delete study_preference_url(@study_preference)
    end
    assert_redirected_to study_preferences_url
  end
end
