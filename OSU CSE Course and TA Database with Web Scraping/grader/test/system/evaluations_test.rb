require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "creating a Evaluation" do
    visit evaluations_url
    click_on "New Evaluation"

    fill_in "Appearance", with: @evaluation.Appearance
    fill_in "Character", with: @evaluation.Character
    fill_in "Communication", with: @evaluation.Communication
    fill_in "Cooperation", with: @evaluation.Cooperation
    fill_in "Coursenumber", with: @evaluation.CourseNumber
    fill_in "Dedication", with: @evaluation.Dedication
    fill_in "Initiative", with: @evaluation.Initiative
    fill_in "Instructorname", with: @evaluation.InstructorName
    fill_in "Performance", with: @evaluation.Performance
    fill_in "Personality", with: @evaluation.Personality
    fill_in "Responsiveness", with: @evaluation.Responsiveness
    fill_in "Studentname", with: @evaluation.StudentName
    fill_in "Workhabit", with: @evaluation.WorkHabit
    fill_in "Grader application", with: @evaluation.grader_application_id
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Evaluation" do
    visit evaluations_url
    click_on "Edit", match: :first

    fill_in "Appearance", with: @evaluation.Appearance
    fill_in "Character", with: @evaluation.Character
    fill_in "Communication", with: @evaluation.Communication
    fill_in "Cooperation", with: @evaluation.Cooperation
    fill_in "Coursenumber", with: @evaluation.CourseNumber
    fill_in "Dedication", with: @evaluation.Dedication
    fill_in "Initiative", with: @evaluation.Initiative
    fill_in "Instructorname", with: @evaluation.InstructorName
    fill_in "Performance", with: @evaluation.Performance
    fill_in "Personality", with: @evaluation.Personality
    fill_in "Responsiveness", with: @evaluation.Responsiveness
    fill_in "Studentname", with: @evaluation.StudentName
    fill_in "Workhabit", with: @evaluation.WorkHabit
    fill_in "Grader application", with: @evaluation.grader_application_id
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluation" do
    visit evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluation was successfully destroyed"
  end
end
