require "test_helper"

class SpeacialCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speacial_code = speacial_codes(:one)
  end

  test "should get index" do
    get speacial_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_speacial_code_url
    assert_response :success
  end

  test "should create speacial_code" do
    assert_difference("SpeacialCode.count") do
      post speacial_codes_url, params: { speacial_code: {  } }
    end

    assert_redirected_to speacial_code_url(SpeacialCode.last)
  end

  test "should show speacial_code" do
    get speacial_code_url(@speacial_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_speacial_code_url(@speacial_code)
    assert_response :success
  end

  test "should update speacial_code" do
    patch speacial_code_url(@speacial_code), params: { speacial_code: {  } }
    assert_redirected_to speacial_code_url(@speacial_code)
  end

  test "should destroy speacial_code" do
    assert_difference("SpeacialCode.count", -1) do
      delete speacial_code_url(@speacial_code)
    end

    assert_redirected_to speacial_codes_url
  end
end
