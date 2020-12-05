class CourseSectionsController < ApplicationController

  # GET /course_sections
  # GET /course_sections.json
  def index
    @course_sections = CourseSection.all
  end

  # POST /course_sections
  # POST /course_sections.json
  def create
    redirect_to request.referrer
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_section
      @course_section = CourseSection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_section_params
      params.permit(:Name, :ClassNumber, :Component, :Location, :Times, :Instructor, :Session, :Topic)
    end
end
