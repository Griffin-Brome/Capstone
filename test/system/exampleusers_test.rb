require "application_system_test_case"

class ExampleusersTest < ApplicationSystemTestCase
  setup do
    @exampleuser = exampleusers(:one)
  end

  test "visiting the index" do
    visit exampleusers_url
    assert_selector "h1", text: "Exampleusers"
  end

  test "creating a Exampleuser" do
    visit exampleusers_url
    click_on "New Exampleuser"

    fill_in "Email", with: @exampleuser.email
    fill_in "Password", with: @exampleuser.password
    click_on "Create Exampleuser"

    assert_text "Exampleuser was successfully created"
    click_on "Back"
  end

  test "updating a Exampleuser" do
    visit exampleusers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @exampleuser.email
    fill_in "Password", with: @exampleuser.password
    click_on "Update Exampleuser"

    assert_text "Exampleuser was successfully updated"
    click_on "Back"
  end

  test "destroying a Exampleuser" do
    visit exampleusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exampleuser was successfully destroyed"
  end
end
