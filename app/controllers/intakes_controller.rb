class IntakesController < ApplicationController
  before_action :set_intake, only: [:show]

  # GET /intakes
  # GET /intakes.json
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1
  # GET /intakes/1.json
  def show; end

  # GET /intakes/new
  def new
    @intake = Intake.new
  end

  # POST /intakes
  # POST /intakes.json
  def create
    @intake = Intake.new(intake_params)

    respond_to do |format|
      if @intake.save
        IntakeMailer.with(intake: @intake).triage_email.deliver_later
        format.html { redirect_to @intake, notice: 'Intake was successfully created.' }
        format.json { render :show, status: :created, location: @intake }
      else
        format.html { render :new }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_intake
    @intake = Intake.find(params[:id])
  end

  def intake_params
    params.require(:intake).permit(:name, :message, :email)
  end
end
