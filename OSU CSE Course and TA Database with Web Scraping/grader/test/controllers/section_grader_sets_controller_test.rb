require 'test_helper'

class SectionGraderSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section_grader_set = section_grader_sets(:one)
  end

  test "should get index" do
    get section_grader_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_section_grader_set_url
    assert_response :success
  end

  test "should create section_grader_set" do
    assert_difference('SectionGraderSet.count') do
      post section_grader_sets_url, params: { section_grader_set: { CourseNumber: @section_grader_set.CourseNumber, Names: @section_grader_set.Names, course_section_id: @section_grader_set.course_section_id } }
    end

    assert_redirected_to section_grader_set_url(SectionGraderSet.last)
  end

  test "should show section_grader_set" do
    get section_grader_set_url(@section_grader_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_grader_set_url(@section_grader_set)
    assert_response :success
  end

  test "should update section_grader_set" do
    patch section_grader_set_url(@section_grader_set), params: { section_grader_set: { CourseNumber: @section_grader_set.CourseNumber, Names: @section_grader_set.Names, course_section_id: @section_grader_set.course_section_id } }
    assert_redirected_to section_grader_set_url(@section_grader_set)
  end

  test "should destroy section_grader_set" do
    assert_difference('SectionGraderSet.count', -1) do
      delete section_grader_set_url(@section_grader_set)
    end

    assert_redirected_to section_grader_sets_url
  end
end
