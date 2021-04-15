# frozen_string_literal: true

require 'test_helper'

class DeadlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deadline = deadlines(:one)
    @today = Date.current
  end

  test 'should get index' do
    get deadlines_url
    assert_response :success
  end

  test 'should show calendar' do
    get '/'
    assert_select 'h2', @today.strftime('%B %Y') # https://ruby-doc.org/stdlib-3.0.0/libdoc/date/rdoc/Date.html#method-i-strftime
    assert css_select '.deadline'.size.zero?   # Deadlines shouldn't show up yet
  end

  test 'should get new' do
    get new_deadline_url
    assert_response :success
  end

  test 'should create deadline' do
    assert_difference('Deadline.count') do
      post deadlines_url,
           params: { deadline: { name: @deadline.name, description: @deadline.description, date: @deadline.date } }
    end
    assert_redirected_to deadline_url(Deadline.last)
    get deadlines_url
    assert css_select '.deadline'.size == 1
  end

  test 'should show deadline' do
    get deadline_url(@deadline)
    assert_response :success
  end

  test 'should get edit' do
    get edit_deadline_url(@deadline)
    assert_response :success
  end

  test 'should update deadline' do
    patch deadline_url(Deadline.last),
          params: { deadline: { name: @deadline.name, description: @deadline.description, date: @deadline.date } }
    assert_redirected_to deadline_url(Deadline.last)
  end

  test 'should destroy deadline' do
    assert_difference('Deadline.count', -1) do
      delete deadline_url(@deadline)
    end
    assert_redirected_to deadlines_url
  end
end
