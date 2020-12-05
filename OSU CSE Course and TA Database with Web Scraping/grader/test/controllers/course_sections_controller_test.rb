require 'test_helper'

class CourseSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_section = course_sections(:one)
  end

  test "should get index" do
    get course_sections_url
    assert_response :success
  end
end
