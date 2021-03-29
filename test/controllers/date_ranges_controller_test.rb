require "test_helper"

class DateRangeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_range = date_ranges(:one)
  end

  test 'should get index' do
    get date_ranges_url
    assert_response :success
  end

  test 'should get new' do
    get new_date_range_url
    assert_response :success
  end

  test 'should create date range' do
    assert_difference('DateRange.count') do
      post date_ranges_url,
           params: { date_range: { name: @date_range.name, start: @date_range.start, end: @date_range.end} }
    end

    assert_redirected_to date_range_url(DateRange.last)
  end

  test 'should show date range' do
    get date_range_url(@date_range)
    assert_response :success
  end

  test 'should get edit' do
    get edit_date_range_url(@date_range)
    assert_response :success
  end

  test 'should update date range' do
    patch date_range_url(DateRange.last),
          params: { date_range:
                                        { name: @date_range.name,
                                          start: @date_range.start,
                                          end: @date_range.end } }
    assert_redirected_to date_range_url(DateRange.last)
  end

  test 'should destroy date range' do
    assert_difference('DateRange.count', -1) do
      delete date_range_url(@date_range)
    end
    assert_redirected_to date_ranges_url
  end
end
