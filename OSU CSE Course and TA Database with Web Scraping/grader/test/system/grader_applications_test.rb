require "application_system_test_case"

class GraderApplicationsTest < ApplicationSystemTestCase
  setup do
    @grader_application = grader_applications(:one)
  end

  test "visiting the index" do
    visit grader_applications_url
    assert_selector "h1", text: "Grader Applications"
  end

  test "creating a Grader application" do
    visit grader_applications_url
    click_on "New Grader Application"

    fill_in "Availabletimes", with: @grader_application.AvailableTimes
    fill_in "Coursestaken", with: @grader_application.CoursesTaken
    fill_in "Email", with: @grader_application.Email
    fill_in "Gpa", with: @grader_application.GPA
    fill_in "Interestedcourses", with: @grader_application.InterestedCourses
    fill_in "Name", with: @grader_application.Name
    fill_in "Course section", with: @grader_application.course_section_id
    click_on "Create Grader application"

    assert_text "Grader application was successfully created"
    click_on "Back"
  end

  test "updating a Grader application" do
    visit grader_applications_url
    click_on "Edit", match: :first

    fill_in "Availabletimes", with: @grader_application.AvailableTimes
    fill_in "Coursestaken", with: @grader_application.CoursesTaken
    fill_in "Email", with: @grader_application.Email
    fill_in "Gpa", with: @grader_application.GPA
    fill_in "Interestedcourses", with: @grader_application.InterestedCourses
    fill_in "Name", with: @grader_application.Name
    fill_in "Course section", with: @grader_application.course_section_id
    click_on "Update Grader application"

    assert_text "Grader application was successfully updated"
    click_on "Back"
  end

  test "destroying a Grader application" do
    visit grader_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grader application was successfully destroyed"
  end
end
