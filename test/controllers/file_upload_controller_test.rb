require 'test_helper'

class FileUploadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_upload_index_url
    assert_response :success
  end

  test "should get new" do
    get file_upload_new_url
    assert_response :success
  end

  test "should get create" do
    get file_upload_create_url
    assert_response :success
  end

  test "should get destroy" do
    get file_upload_destroy_url
    assert_response :success
  end

end
