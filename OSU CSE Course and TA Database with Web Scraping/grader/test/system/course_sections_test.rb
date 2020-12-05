require "application_system_test_case"

class CourseSectionsTest < ApplicationSystemTestCase
  setup do
    @course_section = course_sections(:one)
  end

  test "visiting the index" do
    visit course_sections_url
    assert_selector "h1", text: "Course Sections"
  end

  test "creating a Course section" do
    visit course_sections_url
    click_on "New Course Section"

    fill_in "Classnumber", with: @course_section.ClassNumber
    fill_in "Component", with: @course_section.Component
    fill_in "Instructor", with: @course_section.Instructor
    fill_in "Location", with: @course_section.Location
    fill_in "Name", with: @course_section.Name
    fill_in "Session", with: @course_section.Session
    fill_in "Times", with: @course_section.Times
    fill_in "Topic", with: @course_section.Topic
    click_on "Create Course section"

    assert_text "Course section was successfully created"
    click_on "Back"
  end

  test "updating a Course section" do
    visit course_sections_url
    click_on "Edit", match: :first

    fill_in "Classnumber", with: @course_section.ClassNumber
    fill_in "Component", with: @course_section.Component
    fill_in "Instructor", with: @course_section.Instructor
    fill_in "Location", with: @course_section.Location
    fill_in "Name", with: @course_section.Name
    fill_in "Session", with: @course_section.Session
    fill_in "Times", with: @course_section.Times
    fill_in "Topic", with: @course_section.Topic
    click_on "Update Course section"

    assert_text "Course section was successfully updated"
    click_on "Back"
  end

  test "destroying a Course section" do
    visit course_sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course section was successfully destroyed"
  end
end
