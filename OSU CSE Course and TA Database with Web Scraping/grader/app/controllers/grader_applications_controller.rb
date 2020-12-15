class GraderApplicationsController < ApplicationController
  before_action :set_grader_application, only: [:show, :edit, :update, :destroy]

  # GET /grader_applications
  # GET /grader_applications.json
  def index
    @grader_applications = GraderApplication.all
  end

  # GET /grader_applications/1
  # GET /grader_applications/1.json
  def show
  end

  # GET /grader_applications/new
  def new
    @grader_application = GraderApplication.new
  end

  # GET /grader_applications/1/edit
  def edit
  end

  # POST /grader_applications
  # POST /grader_applications.json
  def create
    @grader_application = GraderApplication.new(grader_application_params)

    respond_to do |format|
      if @grader_application.save
        format.html { redirect_to @grader_application, notice: 'Grader application was successfully created.' }
        format.json { render :show, status: :created, location: @grader_application }
      else
        format.html { render :new }
        format.json { render json: @grader_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grader_applications/1
  # PATCH/PUT /grader_applications/1.json
  def update
    respond_to do |format|
      if @grader_application.update(grader_application_params)
        format.html { redirect_to @grader_application, notice: 'Grader application was successfully updated.' }
        format.json { render :show, status: :ok, location: @grader_application }
      else
        format.html { render :edit }
        format.json { render json: @grader_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grader_applications/1
  # DELETE /grader_applications/1.json
  def destroy
    @grader_application.destroy
    respond_to do |format|
      format.html { redirect_to grader_applications_url, notice: 'Grader application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grader_application
      @grader_application = GraderApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grader_application_params
      params.require(:grader_application).permit(:Name, :Email, :GPA, :InterestedCourses, :AvailableTimes)
    end
end
