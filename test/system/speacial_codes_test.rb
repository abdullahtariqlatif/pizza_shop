require "application_system_test_case"

class SpeacialCodesTest < ApplicationSystemTestCase
  setup do
    @speacial_code = speacial_codes(:one)
  end

  test "visiting the index" do
    visit speacial_codes_url
    assert_selector "h1", text: "Speacial codes"
  end

  test "should create speacial code" do
    visit speacial_codes_url
    click_on "New speacial code"

    click_on "Create Speacial code"

    assert_text "Speacial code was successfully created"
    click_on "Back"
  end

  test "should update Speacial code" do
    visit speacial_code_url(@speacial_code)
    click_on "Edit this speacial code", match: :first

    click_on "Update Speacial code"

    assert_text "Speacial code was successfully updated"
    click_on "Back"
  end

  test "should destroy Speacial code" do
    visit speacial_code_url(@speacial_code)
    click_on "Destroy this speacial code", match: :first

    assert_text "Speacial code was successfully destroyed"
  end
end
