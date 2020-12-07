require "application_system_test_case"

class SectionGraderSetsTest < ApplicationSystemTestCase
  setup do
    @section_grader_set = section_grader_sets(:one)
  end

  test "visiting the index" do
    visit section_grader_sets_url
    assert_selector "h1", text: "Section Grader Sets"
  end

  test "creating a Section grader set" do
    visit section_grader_sets_url
    click_on "New Section Grader Set"

    fill_in "Coursenumber", with: @section_grader_set.CourseNumber
    fill_in "Names", with: @section_grader_set.Names
    fill_in "Course section", with: @section_grader_set.course_section_id
    click_on "Create Section grader set"

    assert_text "Section grader set was successfully created"
    click_on "Back"
  end

  test "updating a Section grader set" do
    visit section_grader_sets_url
    click_on "Edit", match: :first

    fill_in "Coursenumber", with: @section_grader_set.CourseNumber
    fill_in "Names", with: @section_grader_set.Names
    fill_in "Course section", with: @section_grader_set.course_section_id
    click_on "Update Section grader set"

    assert_text "Section grader set was successfully updated"
    click_on "Back"
  end

  test "destroying a Section grader set" do
    visit section_grader_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section grader set was successfully destroyed"
  end
end
