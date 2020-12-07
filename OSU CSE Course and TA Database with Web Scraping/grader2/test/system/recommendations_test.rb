require "application_system_test_case"

class RecommendationsTest < ApplicationSystemTestCase
  setup do
    @recommendation = recommendations(:one)
  end

  test "visiting the index" do
    visit recommendations_url
    assert_selector "h1", text: "Recommendations"
  end

  test "creating a Recommendation" do
    visit recommendations_url
    click_on "New Recommendation"

    fill_in "Instructorcourse", with: @recommendation.InstructorCourse
    fill_in "Instructordepartment", with: @recommendation.InstructorDepartment
    fill_in "Instructoremail", with: @recommendation.InstructorEmail
    fill_in "Instructorname", with: @recommendation.InstructorName
    fill_in "Recommendation", with: @recommendation.Recommendation
    fill_in "Studentname", with: @recommendation.StudentName
    fill_in "Grader application", with: @recommendation.grader_application_id
    click_on "Create Recommendation"

    assert_text "Recommendation was successfully created"
    click_on "Back"
  end

  test "updating a Recommendation" do
    visit recommendations_url
    click_on "Edit", match: :first

    fill_in "Instructorcourse", with: @recommendation.InstructorCourse
    fill_in "Instructordepartment", with: @recommendation.InstructorDepartment
    fill_in "Instructoremail", with: @recommendation.InstructorEmail
    fill_in "Instructorname", with: @recommendation.InstructorName
    fill_in "Recommendation", with: @recommendation.Recommendation
    fill_in "Studentname", with: @recommendation.StudentName
    fill_in "Grader application", with: @recommendation.grader_application_id
    click_on "Update Recommendation"

    assert_text "Recommendation was successfully updated"
    click_on "Back"
  end

  test "destroying a Recommendation" do
    visit recommendations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recommendation was successfully destroyed"
  end
end
