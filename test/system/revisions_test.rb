require "application_system_test_case"

class RevisionsTest < ApplicationSystemTestCase
  setup do
    @revision = revisions(:one)
  end

  test "visiting the index" do
    visit revisions_url
    assert_selector "h1", text: "Revisions"
  end

  test "creating a Revision" do
    visit revisions_url
    click_on "New Revision"

    fill_in "Contents", with: @revision.contents
    fill_in "Page", with: @revision.page_id
    fill_in "User", with: @revision.user_id
    click_on "Create Revision"

    assert_text "Revision was successfully created"
    click_on "Back"
  end

  test "updating a Revision" do
    visit revisions_url
    click_on "Edit", match: :first

    fill_in "Contents", with: @revision.contents
    fill_in "Page", with: @revision.page_id
    fill_in "User", with: @revision.user_id
    click_on "Update Revision"

    assert_text "Revision was successfully updated"
    click_on "Back"
  end

  test "destroying a Revision" do
    visit revisions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Revision was successfully destroyed"
  end
end
