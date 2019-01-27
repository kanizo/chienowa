require "application_system_test_case"

class SquiresTest < ApplicationSystemTestCase
  setup do
    @squire = squires(:one)
  end

  test "visiting the index" do
    visit squires_url
    assert_selector "h1", text: "Squires"
  end

  test "creating a Squire" do
    visit squires_url
    click_on "New Squire"

    fill_in "Description", with: @squire.description
    fill_in "Title", with: @squire.title
    click_on "Create Squire"

    assert_text "Squire was successfully created"
    click_on "Back"
  end

  test "updating a Squire" do
    visit squires_url
    click_on "Edit", match: :first

    fill_in "Description", with: @squire.description
    fill_in "Title", with: @squire.title
    click_on "Update Squire"

    assert_text "Squire was successfully updated"
    click_on "Back"
  end

  test "destroying a Squire" do
    visit squires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Squire was successfully destroyed"
  end
end
