class Admin::CasesController < ApplicationController
  before_action :set_admin_case, only: [:show, :edit, :update, :destroy]

  # GET /admin/cases
  # GET /admin/cases.json
  def index
    @admin_cases = Admin::Case.where.not(aasm_state: 'closed')
  end

  # GET /admin/cases/1
  # GET /admin/cases/1.json
  def show
    @admin_case.review! if @admin_case.open?
  end

  # GET /admin/cases/new
  def new
    @admin_case = Admin::Case.new
  end

  # GET /admin/cases/1/edit
  def edit
  end

  # POST /admin/cases
  # POST /admin/cases.json
  def create
    @admin_case = Admin::Case.new(admin_case_params)

    respond_to do |format|
      if @admin_case.save
        format.html { redirect_to @admin_case, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @admin_case }
      else
        format.html { render :new }
        format.json { render json: @admin_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cases/1
  # PATCH/PUT /admin/cases/1.json
  def update
    respond_to do |format|
      if @admin_case.update(admin_case_params)
        format.html { redirect_to @admin_case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_case }
      else
        format.html { render :edit }
        format.json { render json: @admin_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cases/1
  # DELETE /admin/cases/1.json
  def destroy
    @admin_case.close!
    respond_to do |format|
      format.html { redirect_to admin_cases_url, notice: 'Case closed!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_case
      @admin_case = Admin::Case.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_case_params
      params.fetch(:admin_case, {})
    end
end
