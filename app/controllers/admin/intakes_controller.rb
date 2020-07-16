class Admin::IntakesController < ApplicationController
  before_action :set_intake, only: [:show]

  # GET /intakes
  # GET /intakes.json
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1
  # GET /intakes/1.json
  def show; end

  private

  def set_intake
    @intake = Intake.find(params[:id])
  end
end
