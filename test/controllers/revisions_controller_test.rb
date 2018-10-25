require 'test_helper'

class RevisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @revision = revisions(:one)
    @page = pages(:one)
  end

  test "should get index" do
    get revisions_url
    assert_response :success
  end

#  test "should create revision" do
#    assert_difference('Revision.count') do
#      post revisions_url, params: { revision: { contents: @revision.contents, page_id: @revision.page_id, user_id: @revision.user_id } }
#    end
#
#    assert_redirected_to revision_url(Revision.last)
#  end

#  test "should show revision" do
#    assert @revision.page.nil?
#    get revision_url(@revision)
#    assert_response :success
#  end

  test "should destroy revision" do
    assert_difference('Revision.count', -1) do
      delete revision_url(@revision)
    end

    assert_redirected_to revisions_url
  end
end
