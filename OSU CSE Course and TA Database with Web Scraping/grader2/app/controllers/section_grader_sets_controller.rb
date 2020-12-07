class SectionGraderSetsController < ApplicationController
  before_action :set_section_grader_set, only: [:show, :edit, :update, :destroy]

  # GET /section_grader_sets
  # GET /section_grader_sets.json
  def index
    @section_grader_sets = SectionGraderSet.all
  end

  # GET /section_grader_sets/1
  # GET /section_grader_sets/1.json
  def show
  end

  # GET /section_grader_sets/new
  def new
    @section_grader_set = SectionGraderSet.new
  end

  # GET /section_grader_sets/1/edit
  def edit
  end

  # POST /section_grader_sets
  # POST /section_grader_sets.json
  def create
    @section_grader_set = SectionGraderSet.new(section_grader_set_params)

    respond_to do |format|
      if @section_grader_set.save
        format.html { redirect_to @section_grader_set, notice: 'Section grader set was successfully created.' }
        format.json { render :show, status: :created, location: @section_grader_set }
      else
        format.html { render :new }
        format.json { render json: @section_grader_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_grader_sets/1
  # PATCH/PUT /section_grader_sets/1.json
  def update
    respond_to do |format|
      if @section_grader_set.update(section_grader_set_params)
        format.html { redirect_to @section_grader_set, notice: 'Section grader set was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_grader_set }
      else
        format.html { render :edit }
        format.json { render json: @section_grader_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_grader_sets/1
  # DELETE /section_grader_sets/1.json
  def destroy
    @section_grader_set.destroy
    respond_to do |format|
      format.html { redirect_to section_grader_sets_url, notice: 'Section grader set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_grader_set
      @section_grader_set = SectionGraderSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_grader_set_params
      params.require(:section_grader_set).permit(:course_section_id, :CourseNumber, :Names)
    end
end
