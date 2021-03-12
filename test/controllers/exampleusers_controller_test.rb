require "test_helper"

class ExampleusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exampleuser = exampleusers(:one)
  end

  test "should get index" do
    get exampleusers_url
    assert_response :success
  end

  test "should get new" do
    get new_exampleuser_url
    assert_response :success
  end

  test "should create exampleuser" do
    assert_difference('Exampleuser.count') do
      post exampleusers_url, params: { exampleuser: { email: @exampleuser.email, password: @exampleuser.password } }
    end

    assert_redirected_to exampleuser_url(Exampleuser.last)
  end

  test "should show exampleuser" do
    get exampleuser_url(@exampleuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_exampleuser_url(@exampleuser)
    assert_response :success
  end

  test "should update exampleuser" do
    patch exampleuser_url(@exampleuser), params: { exampleuser: { email: @exampleuser.email, password: @exampleuser.password } }
    assert_redirected_to exampleuser_url(@exampleuser)
  end

  test "should destroy exampleuser" do
    assert_difference('Exampleuser.count', -1) do
      delete exampleuser_url(@exampleuser)
    end

    assert_redirected_to exampleusers_url
  end
end
